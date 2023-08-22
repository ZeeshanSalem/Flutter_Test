import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:test_app/feature/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardMainScreen extends StatelessWidget {
  const DashboardMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardCubit = context.read<DashboardCubit>();
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: CustomColors.primary,
          body: dashboardCubit.screen[dashboardCubit.selectedPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: CustomColors.gray,
            // unselectedLabelStyle: CustomTypography.pingFangStyle,
            currentIndex: dashboardCubit.selectedPageIndex,
            onTap: (int index) {
              dashboardCubit.updatePage(index);
            },
            selectedItemColor: CustomColors.secondary,
            items: List.generate(
              dashboardCubit.menuItems.length,
              (index) => BottomNavigationBarItem(
                backgroundColor: CustomColors.primary,
                icon: Icon(dashboardCubit.menuItems[index].iconPath),
                label: dashboardCubit.menuItems[index].name,
              ),
            ),
          ),
        );
      },
    );
  }
}
