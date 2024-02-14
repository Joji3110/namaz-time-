import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_namaz/models/model_country.dart';

class CountryState {
  final Country? selectedCountry;

  CountryState({this.selectedCountry});
}

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState());
  void selectedCountry(Country country) {
    emit(CountryState(selectedCountry: country));
  }

  
}
