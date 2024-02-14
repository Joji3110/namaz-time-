import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_namaz/cubit/city_cubit.dart';
import 'package:time_namaz/models/model_country.dart';

class CityListPage extends StatelessWidget {
  final Country? country;

  const CityListPage({super.key, this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор города для ${country?.countryName ?? ''}'),
      ),
      body: ListView.builder(
        itemCount: country?.cities.length ?? 0,
        itemBuilder: (context, index) {
          final city = country?.cities[index];
          return ListTile(
            onTap: () {
              // Действия при выборе города
            },
            title: Text(city?.cityName ?? ''),
          );
        },
      ),
    );
  }
}
