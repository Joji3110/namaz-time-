import 'package:time_namaz/models/namaz_daily.dart';
import 'package:time_namaz/repositories/namaz_time_api.dart';

class NamazTimeRepository {
  final NamazTimeProvider namazTimeProvider = NamazTimeProvider();
  Future<NamazWeek> getAllNamazTime(String cityName) =>
      namazTimeProvider.getTimeNamaz(cityName: cityName);
}
