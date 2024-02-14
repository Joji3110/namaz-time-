abstract class NamazTimeEvent {
  const NamazTimeEvent();
}

class NamazTimeLoadEvent extends NamazTimeEvent {
  final String cityName;

  NamazTimeLoadEvent({required this.cityName});
}

class NamazTimeClearEvent extends NamazTimeEvent {}