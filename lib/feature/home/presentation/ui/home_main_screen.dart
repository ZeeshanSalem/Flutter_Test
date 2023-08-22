import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/typography.dart';

import 'widget/widgets.dart';


class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GreetingTile(),

        /// ==== Category Section ====
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TitleTile(
            title: 'Category',
            trailingWidget: TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'See all >',
                  style: CustomTypography.subTitleStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: CustomColors.secondary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
