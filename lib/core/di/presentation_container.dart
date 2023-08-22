import 'package:test_app/feature/dashboard/presentation/cubit/dashboard_cubit.dart';

import 'injection_container_common.dart';

Future<void> initPresentationDI() async {
  serviceLocator.registerFactory<DashboardCubit>(
    () => DashboardCubit(),
  );
}
