import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c16/ui/home/radio/data/radio_data_source.dart';
import 'package:islami_c16/ui/home/radio/presentation/cubit/radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit(this.dataSource) : super(RadioInitState());

  RadioDataSource dataSource;

  void getRadio() async {
    emit(RadioLoadingState());
    try {
      var response = await dataSource.getRadioData();
      emit(RadioSuccessState(response.radios ?? []));
    } catch (e) {
      emit(RadioErrorState(e.toString()));
    }
  }
}
