import 'radio.dart';

class RadioResponse {
  List<Radio>? radios;

  RadioResponse({this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) => RadioResponse(
    radios: (json['radios'] as List<dynamic>?)
        ?.map((e) => Radio.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'radios': radios?.map((e) => e.toJson()).toList(),
  };
}
