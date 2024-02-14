import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPictureWidget extends StatelessWidget {
  final String assetImage;
  final double height, width;
  final Color? colorSvg;
  const SvgPictureWidget({
    super.key,
    required this.assetImage,
    required this.height,
    required this.width,
    this.colorSvg
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetImage,
      width: width,
      height: height,
      color: colorSvg,
    );
  }
}
