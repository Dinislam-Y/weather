// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/data/models/weather_city.dart';
import 'package:weather/data/repositories/today_repository.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final TodayRepository _repository;

  HomePageCubit({required TodayRepository repository})
      : _repository = repository,
        super(const HomePageState(status: HomePageStatus.initial));

  // getting weather information
  Future getWeather({required String city}) async {

    //get information about internet connection
    ConnectivityResult internet = await Connectivity().checkConnectivity();

    // have a network connection
    if (internet != ConnectivityResult.none) {
      try {
        emit(state.copyWith(status: HomePageStatus.loading));

        final response = await _repository.fetch(city: city); // database query

        emit(
          state.copyWith(
            status: HomePageStatus.loaded,
            weatherCity: response,
          ),
        );
      } catch (error) {  // server error
        emit(
          state.copyWith(
            status: HomePageStatus.errorServer,
            errorMessage: error.toString(),
          ),
        );
      }
    } else {  // no network connection
      emit(
        state.copyWith(
          status: HomePageStatus.errorServer,
          errorMessage: "Нет подключения к интернету",
        ),
      );
    }
  }
}
