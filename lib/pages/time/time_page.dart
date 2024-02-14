import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_namaz/bloc/namaz_time_bloc.dart';

import 'package:time_namaz/bloc/namaz_time_state.dart';
import 'package:time_namaz/pages/time/widgets/app_bar.dart';
import 'package:time_namaz/pages/time/widgets/information_bloc.dart';
import 'package:time_namaz/pages/time/widgets/time_list.dart';
import 'package:time_namaz/utils/constants/color.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamazTimeBloc, NamazTimeState>(
      builder: (context, state) {
        if (state is NamazTimeEmptyState) {
          return const Center(
            child: Text('Данные не загрузились'),
          );
        }

        if (state is NamazTimeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: TColors.iconColorBlue),
          );
        }

        if (state is NamazTimeLoadedState) {
          return SafeArea(
            child: Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppBarWidget(),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: InformationBlocWidget(
                        namazWeek: state.loadedNamaTime,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 620.0,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.loadedNamaTime.items!.length,
                          itemBuilder: ((context, index) {
                            final timeNamaz =
                                state.loadedNamaTime.items![index];
                            final inputDate = timeNamaz.dateFor;

                            final formattedDate =
                                DateFormat('yyyy-MM-dd').parse(inputDate!);

                            final String formattedWithoutTime =
                                DateFormat('dd-MM-yyyy').format(formattedDate);

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150.0,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        color: TColors.containerColorWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Text(
                                        formattedWithoutTime.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: TColors.textColorBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TimeList(
                                    timeNamaz: timeNamaz.fajr,
                                    nameNmaz: 'Фаджр',
                                  ),
                                  const SizedBox(height: 10),
                                  TimeList(
                                    timeNamaz: timeNamaz.shurooq,
                                    nameNmaz: 'Восход',
                                  ),
                                  const SizedBox(height: 10),
                                  TimeList(
                                    timeNamaz: timeNamaz.dhuhr,
                                    nameNmaz: 'Зухр',
                                  ),
                                  const SizedBox(height: 10),
                                  TimeList(
                                    timeNamaz: timeNamaz.asr,
                                    nameNmaz: 'Аср',
                                  ),
                                  const SizedBox(height: 10),
                                  TimeList(
                                    timeNamaz: timeNamaz.maghrib,
                                    nameNmaz: 'Магриб',
                                  ),
                                  const SizedBox(height: 10),
                                  TimeList(
                                    timeNamaz: timeNamaz.isha,
                                    nameNmaz: 'Иша',
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is NamazTimeErrorState) {
          return const Center(
            child: Text('Ошибка при получении данных'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
