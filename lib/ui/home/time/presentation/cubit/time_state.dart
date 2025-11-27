import 'package:islami_c16/ui/home/time/api/respone/model/prayer_times_response.dart';

class TimeState {}

class TimeInitState extends TimeState {}

class TimeLoadingState extends TimeState {}

class TimeSuccessState extends TimeState {
  PrayerTimesResponse response;
  TimeSuccessState(this.response);
}

class TimeErrorState extends TimeState {
  final String massage;
  TimeErrorState(this.massage);
}
