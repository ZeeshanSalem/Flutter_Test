import 'package:test_app/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:test_app/feature/home/presentation/cubits/home_cubit/home_cubit.dart';

import 'injection_container_common.dart';

Future<void> initPresentationDI() async {
  serviceLocator.registerFactory<DashboardCubit>(
    () => DashboardCubit(),
  );

  serviceLocator.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}
