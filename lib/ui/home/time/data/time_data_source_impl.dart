import 'package:islami_c16/ui/home/time/api/respone/model/prayer_times_response.dart';
import 'package:islami_c16/ui/home/time/api/time_api.dart';
import 'package:islami_c16/ui/home/time/data/time_data_source.dart';

class TimeDataSourceImpl implements TimeDataSource {
  TimeApi timeApi;
  TimeDataSourceImpl(this.timeApi);
  @override
  Future<PrayerTimesResponse> getTimeData() async {
    return await timeApi.getTimeData();
  }
}
