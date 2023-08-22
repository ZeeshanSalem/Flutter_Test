
import 'package:flutter/material.dart';
import 'package:test_app/core/constants/typography.dart';

import '../constants/app_colors.dart';

final lightTheme = ThemeData(

  fontFamily: 'lato',
  colorScheme: const ColorScheme.dark(
    primary: CustomColors.primary,
    background: CustomColors.primary,
    secondary: CustomColors.secondary,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.primary,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(

    style: ButtonStyle(
      side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => const BorderSide(color: CustomColors.secondary),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => CustomColors.secondary,
      ),

      elevation: MaterialStateProperty.all(0),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 2,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((_getColor)),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color>(
          (states) => CustomColors.secondary,
    ),
  ),



  // scrollbarTheme: ScrollbarThemeData(
  //   thumbColor:  MaterialStateProperty.resolveWith<Color>(
  //         (states) => CustomColors.magnolia,
  //   ),
  //     trackColor:  MaterialStateProperty.resolveWith<Color>(
  //           (states) => CustomColors.magnolia.withOpacity(0.3),
  //     ),
  //     trackBorderColor:  MaterialStateProperty.resolveWith<Color>(
  //           (states) => CustomColors.white,
  //     ),
  //     thickness:  MaterialStateProperty.resolveWith<double>(
  //           (states) => 15,
  //     )
  // ),
  //todo:
  elevatedButtonTheme: ElevatedButtonThemeData(


    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),

      ) ,
      textStyle: CustomTypography.subTitleStyle.copyWith(
        fontSize: 15,
      ),
      elevation: 0,
      padding:  const EdgeInsets.symmetric(
        horizontal: 15,
      ),
    ),
  ),
  //todo:
  // tabBarTheme: TabBarTheme(
  //   labelColor: CustomColors.secondary,
  //   labelStyle: CustomTypography.dialogTitlePrimary
  //       .copyWith(fontSize: 18, color:CustomColors.secondary, ),
  //   unselectedLabelStyle: CustomTypography.body3Comet,
  //   indicator: const UnderlineTabIndicator(
  //     borderSide: BorderSide(
  //       color: CustomColors.secondary,
  //       width: 2,
  //     ),
  //   ),
  // ),
);

Color _getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.selected
  };
  if (states.any(interactiveStates.contains)) {
    return CustomColors.secondary;
  }
  return CustomColors.gray;
}

double defaultRadius = 3.0;