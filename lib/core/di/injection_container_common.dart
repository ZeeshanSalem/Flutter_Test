import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/config/flavour.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/di/presentation_container.dart';
import 'package:test_app/core/di/remote_container.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/core/util/preferences_util.dart';

import '../logger/app_logger.dart';
import '../logger/pretty_dio_logger.dart';
import '../network/network_client.dart';
import 'domain_container.dart';
import 'injection_container_cache.dart';

final serviceLocator = GetIt.I;

Future<void> initDI() async {
  try {
    serviceLocator.allowReassignment = true;
    // To LOG API Calls (DIO)
    serviceLocator.registerLazySingleton(() => Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 50,
          colors: true,
          printEmojis: true,
          printTime: false,
        )));

    serviceLocator
        .registerLazySingleton(() => AppLogger(logger: serviceLocator()));

    //Initialize NetworkInfo
    serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

    // Initialize DB and Shared preferences.
    //todo: will check this it's not working in web
    await initCacheDI();
    // PreferencesUtil preferences = serviceLocator<PreferencesUtil>();

    await initDIO();

    initPresentationDI();
    initRemoteDI();
    initDomainDI();

    serviceLocator.registerLazySingleton(() => ScrollController());

    // Network Client.
    serviceLocator.registerLazySingleton(
          () => NetworkClient(
        dio: serviceLocator(),
        logger: serviceLocator(),
      ),
    );

    serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  } catch (e, s) {
    debugPrint("Exception in  initDI $e");
    debugPrint("$s");
  }
}

Future<void> initDIO() async {
  try {
    Dio dio = Dio();
    BaseOptions baseOptions = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000),
        //TODO: WILL CHANGE THIS TO FLAVOR SETUP


        baseUrl: F.baseUrl,
        headers: {
          'host': 'localhost',
          'Content-Type': 'application/json',
        },
        maxRedirects: 2);

    dio.options = baseOptions;



    dio.interceptors.clear();

    dio.interceptors.add(PrettyDioLogger(
      requestBody: kDebugMode,
      error: kDebugMode,
      request: kDebugMode,
      compact: kDebugMode,
      maxWidth: 90,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
      // logPrint: (o) {},
    ));



    PreferencesUtil preferences = serviceLocator<PreferencesUtil>();



    dio.interceptors
        .add(QueuedInterceptorsWrapper(onError: (DioException error, handler) async{

        return handler.next(error);



    },
        onRequest: (RequestOptions requestOptions, handler) async {
          var accessToken = Constant.accessToken;

          if (accessToken != "" || accessToken != null) {
            var authHeader = {'Authorization': 'Bearer $accessToken'};
            requestOptions.headers.addAll(authHeader);
            if (requestOptions.path != "/authorize") {
              // requestOptions.headers
              //     .addAll({"code": preferences.getPreferencesData(requestOptions.path+"_code")});
              // requestOptions.headers
              //     .addAll({"verifier": preferences.getPreferencesData(requestOptions.path+"_verifier")});
            } else {
              // requestOptions.headers
              //     .removeWhere((key, value) => key == "Authorization");
            }
          }
          return handler.next(requestOptions);
        }, onResponse: (response, handler) async {
          return handler.next(response);
        }));

    if (serviceLocator.isRegistered<Dio>()) {
      await serviceLocator.unregister<Dio>();
    }

    serviceLocator.registerLazySingleton(() => dio);
  } catch (e, s) {
    debugPrint("Exception in  initDIO $e");
    debugPrint("$s");
  }


}

