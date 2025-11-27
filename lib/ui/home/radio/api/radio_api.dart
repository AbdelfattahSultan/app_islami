import 'package:dio/dio.dart';
import 'package:islami_c16/ui/home/radio/api/radio_respone/radio_response.dart';

class RadioApi {
  final  _dio = Dio();
  RadioApi() {
    _dio;
  }

  Future<RadioResponse> getRadioData() async {
    try {
      var response = await _dio.get(
        "https://mp3quran.net/api/v3/radios?language=eng",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        RadioResponse radioResponse = RadioResponse.fromJson(response.data);
        return radioResponse;
      } else {
        throw Exception("failed to load data");
      }
    } catch (e) {
      throw Exception("failed to load data");
    }
  }
}
