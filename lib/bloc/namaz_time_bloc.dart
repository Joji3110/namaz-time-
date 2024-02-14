import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_namaz/bloc/namaz_time_event.dart';
import 'package:time_namaz/bloc/namaz_time_state.dart';
import 'package:time_namaz/models/namaz_daily.dart';
import 'package:time_namaz/repositories/namaz_repository.dart';

class NamazTimeBloc extends Bloc<NamazTimeEvent, NamazTimeState> {
  final NamazTimeRepository namazTimeRepository;
  NamazTimeBloc({required this.namazTimeRepository})
      : super(NamazTimeEmptyState()) {
    on<NamazTimeLoadEvent>(
      (event, emit) async {
        emit(NamazTimeLoadingState());
        try {
          NamazWeek loadedNamazTimeList =
              await namazTimeRepository.getAllNamazTime(event.cityName);
          emit(NamazTimeLoadedState(loadedNamaTime: loadedNamazTimeList));
          print('Загружены данные: $loadedNamazTimeList');
        } catch (_) {
          emit(NamazTimeEmptyState());
        }
      },
    );
    on<NamazTimeClearEvent>(
      (event, emit) async {
        emit(NamazTimeEmptyState());
      },
    );
  }
}
