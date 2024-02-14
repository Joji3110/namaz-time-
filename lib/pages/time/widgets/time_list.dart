import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:time_namaz/utils/constants/color.dart';
import 'package:time_namaz/widgets/svg_widgets.dart';

class TimeList extends StatelessWidget {
  final String? timeNamaz;
  // final String dateNamaz;
  final String nameNmaz;

  const TimeList({
    super.key,
    required this.timeNamaz,
    required this.nameNmaz,
  });

  @override
  Widget build(BuildContext context) {
    if (timeNamaz == null ||
        !RegExp(r'^\d{1,2}:\d{2} [APMapm]{2}$').hasMatch(timeNamaz!)) {
      return Container();
    }

    List<String> timeParts = timeNamaz!.split(' ');
    List<String> hourMinute = timeParts[0].split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);

    if (timeParts[1].toLowerCase() == 'pm' && hour != 12) {
      hour += 12;
    } else if (timeParts[1].toLowerCase() == 'am' && hour == 12) {
      hour = 0;
    }

    final DateTime dateTime = DateTime(2024, 2, 1, hour, minute);
    final String time24 = DateFormat('HH:mm').format(dateTime);

    return Container(
        width: 370,
        height: 80,
        decoration: BoxDecoration(
          color: TColors.containerColorWhite,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              nameNmaz,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              time24,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: TColors.iconColorBlue,
              ),
            ),
            const SvgPictureWidget(
              assetImage: 'assets/icons/plus-svgrepo-com.svg',
              height: 25.0,
              width: 25.0,
            ),
            const SvgPictureWidget(
              assetImage: 'assets/icons/bell-svgrepo-com.svg',
              height: 33.0,
              width: 33.0,
              colorSvg: TColors.iconColorBlue,
            ),
          ],
        ));
  }
}

class TimeListOne {
  final String timeName;
  final String time;

  TimeListOne({required this.timeName, required this.time});
}
