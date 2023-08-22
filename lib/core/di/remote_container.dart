import 'package:test_app/feature/home/data/data_source/home_remote_data_source.dart';

import 'injection_container_common.dart';

Future<void> initRemoteDI() async {
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSource(
      networkClient: serviceLocator(),
    ),
  );

}
