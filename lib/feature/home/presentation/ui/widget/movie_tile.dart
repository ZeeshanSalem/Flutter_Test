import 'package:flutter/material.dart';
import 'package:test_app/core/common_widgets/image_place_holder.dart';
import 'package:test_app/core/constants/assets_path.dart';
import 'package:test_app/core/constants/typography.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const FadeInImagePlaceHolder(
          image: AssetImage(FlutterTestImages.dummyMovie),
          placeholder: AssetImage(FlutterTestImages.dummyMovie),
          height: 150,
          width: 100,
          radius: 10,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Movie Title',
          style: CustomTypography.titleStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Movie Sub Title',
          style: CustomTypography.titleStyle.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
