import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather/data/models/weatherCity.dart';
import 'package:weather/data/repositories/today_repository.dart';

part 'first_page_state.dart';

class FirstPageCubit extends Cubit<FirstPageState> {
  final TodayRepository _repository;

  FirstPageCubit({required TodayRepository repository})
      : _repository = repository,
        super(const FirstPageState(status: FirstPageStatus.initial));

  // getting weather information
  Future getWeather({required String city}) async {
    //get information about internet connection
    ConnectivityResult internet = await Connectivity().checkConnectivity();

    // have a network connection
    if (internet != ConnectivityResult.none) {
      try {
        emit(state.copyWith(status: FirstPageStatus.loading));

        final response = await _repository.fetch(city: city); // database query

        emit(
          state.copyWith(
            status: FirstPageStatus.loaded,
            weatherCity: response,
          ),
        );
      } catch (error) {
        // server error
        emit(
          state.copyWith(
            status: FirstPageStatus.errorServer,
            errorMessage: error.toString(),
          ),
        );
      }
    } else {
      // no network connection
      emit(
        state.copyWith(
          status: FirstPageStatus.errorServer,
          errorMessage: "Нет подключения к интернету",
        ),
      );
    }
  }
}
