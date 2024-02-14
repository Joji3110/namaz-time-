// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:time_namaz/models/namaz_daily.dart';

abstract class NamazTimeState {}

class NamazTimeEmptyState extends NamazTimeState {}

class NamazTimeLoadingState extends NamazTimeState {}

class NamazTimeLoadedState extends NamazTimeState {
 final NamazWeek loadedNamaTime;
  NamazTimeLoadedState({
    required this.loadedNamaTime,
  });
}

class NamazTimeErrorState extends NamazTimeState {}
