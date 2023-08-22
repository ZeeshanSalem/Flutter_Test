import 'package:flutter/material.dart';

class FadeInImagePlaceHolder extends StatelessWidget {
  final ImageProvider image;
  final ImageProvider placeholder;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;


  const FadeInImagePlaceHolder({
    Key? key,
    required this.image,
    required this.placeholder,
    this.width,
    this.height,
    this.radius = 0,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FadeInImage(
        placeholder: placeholder,
        image: image,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
