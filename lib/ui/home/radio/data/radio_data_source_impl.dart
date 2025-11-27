import 'package:islami_c16/ui/home/radio/api/radio_api.dart';
import 'package:islami_c16/ui/home/radio/api/radio_respone/radio_response.dart';
import 'package:islami_c16/ui/home/radio/data/radio_data_source.dart';

class RadioDataSourceImpl implements RadioDataSource {
  RadioApi radioApi;
  RadioDataSourceImpl(this.radioApi);
  @override
  Future<RadioResponse> getRadioData() async {
    return await radioApi.getRadioData();
  }
}
