import 'package:islami_c16/ui/home/time/api/respone/model/prayer_times_response.dart';

abstract class TimeDataSource {
  Future<PrayerTimesResponse> getTimeData();
}
