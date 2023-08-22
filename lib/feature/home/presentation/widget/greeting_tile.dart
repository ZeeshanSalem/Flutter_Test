import 'package:flutter/material.dart';
import 'package:test_app/core/common_widgets/widgets.dart';
import 'package:test_app/core/constants/assets_path.dart';
import 'package:test_app/core/constants/typography.dart';

class GreetingTile extends StatelessWidget {
  const GreetingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Reema',
                style: CustomTypography.titleStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Bring popcorn, it\'s movie time',
                style: CustomTypography.titleStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),


         const FadeInImagePlaceHolder(
            height: 40,
            width: 40,
            image:  AssetImage(FlutterTestImages.dummyProfile),
            placeholder:  AssetImage(FlutterTestImages.dummyProfile),
          )

        ],
      ),
    );
  }
}
