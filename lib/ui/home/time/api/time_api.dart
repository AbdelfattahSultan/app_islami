import 'package:dio/dio.dart';
import 'package:islami_c16/ui/home/time/api/respone/model/prayer_times_response.dart';

class TimeApi {
  final Dio _dio;

  TimeApi(this._dio);

  Future<PrayerTimesResponse> getTimeData() async {
    try {
      var q = {"city": "Cairo", "country": "Egypt", "method": 5};
      final response = await _dio.get(
        'https://api.aladhan.com/v1/timingsByCity',
        queryParameters: q,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        PrayerTimesResponse timeResponse = PrayerTimesResponse.fromJson(
          response.data,
        );
        return timeResponse;
      } else {
        throw Exception("failed to get data");
      }
    } on Exception {
      throw Exception("failed to get data");
    }
  }
}
