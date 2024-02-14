

class Country {
  final String countryName;
  final int countryIndex;
  final List<City> cities;

  Country({
    required this.countryName,
    required this.countryIndex,
    required this.cities,
  });
}

class City {
  final String cityName;
  final int cityIndex;

  City({
    required this.cityName,
    required this.cityIndex,
  });
}
