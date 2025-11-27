import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c16/ui/home/time/data/time_data_source.dart';
import 'package:islami_c16/ui/home/time/presentation/cubit/time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  final TimeDataSource dataSource;
  TimeCubit(this.dataSource) : super(TimeInitState());

  void getPrayerTimes() async {
    emit(TimeLoadingState());
    try {
      var response = await dataSource.getTimeData();
      emit(TimeSuccessState(response));
    } catch (e) {
      emit(TimeErrorState(e.toString()));
    }
  }
}
