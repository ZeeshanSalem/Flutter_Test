import 'package:flutter/material.dart';

import '../widget/widgets.dart';


class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        GreetingTile(),


      ],
    );
  }
}
