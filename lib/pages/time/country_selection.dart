import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_namaz/bloc/namaz_time_bloc.dart';
import 'package:time_namaz/bloc/namaz_time_event.dart';

import 'package:time_namaz/cubit/country_cubit.dart';
import 'package:time_namaz/models/model_country.dart';
import 'package:time_namaz/repositories/namaz_repository.dart';
import 'package:time_namaz/utils/constants/color.dart';

class CountrySelection extends StatelessWidget {
  const CountrySelection({super.key});

  @override
  Widget build(BuildContext context) {
    final NamazTimeBloc namazTimeBloc = BlocProvider.of<NamazTimeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор страны'),
        backgroundColor: TColors.containerColorBlue,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, countryState) {
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text('Выберите город'),
                                const Divider(),
                                const SizedBox(height: 16),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: country.cities.length,
                                    itemBuilder: (context, index) {
                                      final city = country.cities[index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            onTap: () async {
                                              final selectedCity =
                                                  country.cities[index];
                                              NamazTimeRepository
                                                  namazTimeRepository =
                                                  NamazTimeRepository();

                                              try {
                                                final namazWeek =
                                                    await namazTimeRepository
                                                        .getAllNamazTime(
                                                            selectedCity
                                                                .cityName);
                                                namazTimeBloc.add(
                                                    NamazTimeLoadEvent(
                                                        cityName: selectedCity
                                                            .cityName));

                                                print(
                                                    'Время намаза для ${selectedCity.cityName}: ${namazWeek.items!.first.fajr}');
                                              } catch (error) {
                                                // Обработка ошибки
                                                print(
                                                    'Ошибка при получении времени намаза: $error');
                                              }
                                            },
                                            title: Text(city.cityName),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    title: Text(country.countryName),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

List<Country> countries = [
  Country(
    countryName: 'Кыргызстан',
    countryIndex: 0,
    cities: [
      City(cityName: 'ош', cityIndex: 0),
      City(cityName: 'бишкек', cityIndex: 1),
      City(cityName: 'нарын', cityIndex: 2),
    ],
  ),
  Country(
    countryName: 'Россия',
    countryIndex: 1,
    cities: [
      City(cityName: 'иркутск', cityIndex: 0),
      City(cityName: 'москва', cityIndex: 1),
      City(cityName: 'чита', cityIndex: 2),
    ],
  ),
];
