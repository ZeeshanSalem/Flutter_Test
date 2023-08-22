import 'package:flutter/material.dart';
import 'package:test_app/core/constants/typography.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({Key? key, required this.title,
     this.trailingWidget
  }) : super(key: key);
  final String title;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomTypography.titleStyle.copyWith(
            fontSize: 18,
          ),
        ),

        trailingWidget ?? const SizedBox(),
      ],
    );
  }
}
