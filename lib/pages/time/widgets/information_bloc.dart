import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:time_namaz/models/namaz_daily.dart';
import 'package:time_namaz/utils/constants/color.dart';
import 'package:time_namaz/widgets/svg_widgets.dart';

class InformationBlocWidget extends StatelessWidget {
  final NamazWeek namazWeek;
  const InformationBlocWidget({super.key, required this.namazWeek});

  @override
  Widget build(
    BuildContext context,
  ) {
    initializeDateFormatting('ru');

    return Container(
      decoration: const BoxDecoration(
          color: TColors.containerColorWhite,
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: namazWeek.items!.length,
                  itemBuilder: (context, index) {
                    final timeNamaz = namazWeek.items![index];
                    final inputDate = timeNamaz.dateFor;
                    final formattedDate =
                        DateFormat('yyyy-MM-dd').parse(inputDate!);
                    final String formattedWithoutTime =
                        DateFormat('d MMMM yyyy', 'ru').format(formattedDate);

                    String nearestNamaz = '';
                    String nearestNamazTime = '';
                    DateTime currentTime = DateTime.now();
                    bool isNearestNamazFound = false;

                    final List<String> namazTimes = [
                      timeNamaz.fajr!,
                      timeNamaz.dhuhr!,
                      timeNamaz.asr!,
                      timeNamaz.maghrib!,
                      timeNamaz.isha!,
                    ];

                    final List<String> namazNames = [
                      'Фаджр',
                      'Зухр',
                      'Аср',
                      'Магриб',
                      'Иша',
                    ];

                    for (int i = 0; i < namazTimes.length; i++) {
                      String time = namazTimes[i];
                      List<String> components = time.split(' ');
                      String timeString = components[0];
                      String amPm = components[1];

                      List<String> timeComponents = timeString.split(':');
                      int hours = int.parse(timeComponents[0]);
                      int minutes = int.parse(timeComponents[1]);

                      if (amPm == 'pm' && hours != 12) {
                        hours += 12;
                      }

                      DateTime namazDateTime = DateTime(currentTime.year,
                          currentTime.month, currentTime.day, hours, minutes);

                      if (namazDateTime.isAfter(currentTime) &&
                          !isNearestNamazFound) {
                        nearestNamaz = namazNames[i];
                        nearestNamazTime = time;
                        isNearestNamazFound = true;
                      }
                    }

                    // Проверка наличия следующего времени
                    if (!isNearestNamazFound) {
                      nearestNamaz = 'Фаджр';
                      nearestNamazTime = timeNamaz.fajr!;
                    }

                    return index == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formattedWithoutTime.toString(),
                                    style: const TextStyle(fontSize: 19.0),
                                  ),
                                  const SizedBox(height: 3.0),
                                  const SizedBox(height: 6.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SvgPictureWidget(
                                        assetImage:
                                            'assets/icons/location-pin-svgrepo-com (1).svg',
                                        height: 17.0,
                                        width: 17.0,
                                        colorSvg: TColors.iconColorBlue,
                                      ),
                                      const SizedBox(width: 3.0),
                                      Column(
                                        children: [
                                          Text(
                                            namazWeek.title.toString(),
                                            style: const TextStyle(
                                                color: TColors.textColorBlue),
                                          ),
                                          Container(
                                            width: 140.0,
                                            height: 0.7,
                                            color: TColors.containerColorDark,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  GestureDetector(
                                    onTap: () => context.go('/countrySelection'),
                                    child: Container(
                                      width: 250,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: TColors.containerColorBlue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPictureWidget(
                                            assetImage:
                                                'assets/icons/location-pin-svgrepo-com (1).svg',
                                            height: 17.0,
                                            width: 17.0,
                                            colorSvg: TColors.iconColorWhite,
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'Изменить местоположение',
                                            style: TextStyle(
                                                color: TColors.textColorWhite,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 9.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(nearestNamaz,
                                        style: const TextStyle(fontSize: 23.0)),
                                    Text(
                                      DateFormat('HH:mm').format(
                                        DateFormat('h:mm a').parse(
                                          nearestNamazTime
                                              .replaceAll('pm', 'PM')
                                              .replaceAll('am', 'AM'),
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 26.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
