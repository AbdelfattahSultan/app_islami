import 'package:islami_c16/ui/home/radio/api/radio_respone/radio_response.dart';

abstract class RadioDataSource {
  Future<RadioResponse> getRadioData();
}
