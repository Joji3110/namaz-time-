import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_namaz/cubit/country_cubit.dart';
import 'package:time_namaz/models/model_country.dart';

class CityState {
  final City? selectedCity;

  CityState({this.selectedCity});
}

class CityCubit extends Cubit<CityState> {
  final CountryCubit countryCubit;
  CityCubit({required this.countryCubit}) : super(CityState());

  void selectedCity(City city) {
    emit(CityState(selectedCity: city));
  }

  void clearCity() {
    emit(CityState());
  }

  Country getSelectedCountry() {
    return countryCubit.state.selectedCountry!;
  }
}
