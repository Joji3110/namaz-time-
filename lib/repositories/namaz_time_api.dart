import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/namaz_daily.dart';

class NamazTimeProvider {
  Future<NamazWeek> getTimeNamaz({String? cityName}) async {
    final url = Uri.parse(
        'https://muslimsalat.com/$cityName/weekly.json?key=d12234b2045f5e189d172ec137c4c2e4');

    final response = await http.get(url);

    print('responce: ${response.body}');

    if (response.statusCode == 200) {
      return NamazWeek.fromJson(json.decode(response.body));
    } else {
      return Future.error('Ошибка при получении времени ');
    }
  }
}
