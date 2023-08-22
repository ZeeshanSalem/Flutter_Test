import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/util/preferences_util.dart';

import 'injection_container_common.dart';

Future<void> initCacheDI() async {
  // late Database database;

  // // Database initialization.
  // onCreateDB(Database database, int version) async {
  //   // Create DB table, based on the below query.
  //   await database.execute('');
  // }
  //
  // if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
  //   database = await openDatabase(
  //     join(await getDatabasesPath(), "demoapp14.db"),
  //     onCreate: onCreateDB,
  //     version: 3,
  //   );
  //
  //   debugPrint('initCacheDI openDatabase: ${database.isOpen}');
  // }
  //
  // serviceLocator.registerLazySingleton<AppDatabase>(
  //     () => AppDatabase(database: database, logger: serviceLocator()));

  // Local Cache/ Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  serviceLocator.registerLazySingleton<PreferencesUtil>(() => PreferencesUtil(
      preferences: sharedPreferences, logger: serviceLocator()));
}