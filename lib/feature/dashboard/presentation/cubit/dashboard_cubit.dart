import 'package:flutter/material.dart';
import 'package:test_app/core/cubit/base_cubit.dart';
import 'package:test_app/core/data/model/nav_bar.dart';
import 'package:test_app/feature/home/presentation/home_main_screen/home_main_screen.dart';
import 'dashboard_state.dart';

class DashboardCubit extends BaseCubit<DashboardState>  {
  DashboardCubit()
      : super(const DashboardState(status: DashboardStatus.initial));


  int selectedPageIndex = 0;

  final List<Widget> screen = const [
    HomeMainScreen(),
    SizedBox(),
    SizedBox(),
  ];

  List<NaviBarModel> menuItems = [
    NaviBarModel(iconPath: Icons.home , name: 'Home',),
    NaviBarModel(iconPath: Icons.explore , name: 'Explore',),
    NaviBarModel(iconPath: Icons.save_alt, name: 'Saved',),
  ];
  updatePage(int index) {
    emit(
      state.copyWith(status: DashboardStatus.loading),
    );

    selectedPageIndex = index;

    emit(
      state.copyWith(status: DashboardStatus.success),
    );
  }
}
