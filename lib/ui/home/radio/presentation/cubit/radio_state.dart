import 'package:islami_c16/ui/home/radio/api/radio_respone/radio.dart';

class RadioState {}

class RadioInitState extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioSuccessState extends RadioState {
  List<Radio> radios;
  RadioSuccessState(this.radios);
}

class RadioErrorState extends RadioState {
  final String massage;
  RadioErrorState(this.massage);
}
