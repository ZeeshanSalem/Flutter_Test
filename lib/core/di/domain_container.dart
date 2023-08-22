import 'package:test_app/feature/home/data/repository_impl/home_repository_impl.dart';
import 'package:test_app/feature/home/domain/repository/home_repository.dart';

import 'injection_container_common.dart';

Future<void> initDomainDI() async {
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: serviceLocator(),
      homeRemoteDataSource: serviceLocator(),
    ),
  );
}
