import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({Key? key, this.text, this.style, this.textAlign}) : super(key: key);
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text('$text',
    style: style,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
