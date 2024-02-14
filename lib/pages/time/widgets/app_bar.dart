import 'package:flutter/material.dart';
import 'package:time_namaz/utils/constants/color.dart';

import 'package:time_namaz/widgets/svg_widgets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPictureWidget(
            assetImage: 'assets/icons/set-up-svgrepo-com.svg',
            height: 30,
            width: 30,
            colorSvg: TColors.iconColorBlue,
          ),
          SvgPictureWidget(
            assetImage: 'assets/icons/sun-svgrepo-com.svg',
            height: 30,
            width: 30,
            colorSvg: TColors.iconColorBlue,
          ),
        ],
      ),
    );
  }
}
