// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:weather/data/models/info_days.dart';
import 'package:weather/data/repositories/days_info_repository.dart';

part 'days_info_state.dart';

class DaysInfoCubit extends Cubit<DaysInfoState> {
  final DaysInfoRepository _repository;

  DaysInfoCubit({
    required DaysInfoRepository repository,
  })  : _repository = repository,
        super(DaysInfoState(status: DaysInfoStatus.initial));

  // getting weather information
  Future getInfo({required String city}) async {
    emit(state.copyWith(status: DaysInfoStatus.loading));
    final response = await _repository.fetch(city: city);
    emit(state.copyWith(status: DaysInfoStatus.loaded, info: response));
  }
}
