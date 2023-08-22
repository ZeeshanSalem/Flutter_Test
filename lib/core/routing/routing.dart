import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/core/di/injection_container_common.dart';
import 'package:test_app/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:test_app/feature/dashboard/presentation/dashboard_main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final GoRouter newRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<DashboardCubit>(
          create: (context) => serviceLocator<DashboardCubit>(),
          child: const DashboardMainScreen(),
        );
      },

    ),
  ],
);
