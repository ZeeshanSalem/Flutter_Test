import 'package:flutter/material.dart';

class FadeInImagePlaceHolder extends StatelessWidget {
  final ImageProvider image;
  final ImageProvider placeholder;
  final Widget? child;
  final Duration duration;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;


  const FadeInImagePlaceHolder({
    Key? key,
    required this.image,
    required this.placeholder,
    this.duration = const Duration(milliseconds: 100),
    this.excludeFromSemantics = false,
    this.child,
    this.width,
    this.height,
    this.radius = 0,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image(
    //   image: image,
    //   excludeFromSemantics: excludeFromSemantics,
    //   width: width,
    //   height: height,
    //   fit: fit,
    //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
    //     if (wasSynchronouslyLoaded) {
    //       return this.child ?? child;
    //     } else {
    //       return AnimatedSwitcher(
    //         duration: duration,
    //         child: frame != null ? this.child ?? child : placeholder,
    //       );
    //     }
    //   },
    // );

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
