part of 'home_page_cubit.dart';

// weather screen states
enum HomePageStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class HomePageState {
  final HomePageStatus _status;
  final WeatherCity? _weatherCity;
  final String? _errorMessage; // server error

  const HomePageState({
    required HomePageStatus status,
    WeatherCity? weatherCity,
    String? errorMessage,
  })  : _status = status,
        _weatherCity = weatherCity,
        _errorMessage = errorMessage;

  String? get errorMessage => _errorMessage;

  WeatherCity? get weatherCity => _weatherCity;

  HomePageStatus get status => _status;

  HomePageState copyWith({
    HomePageStatus? status,
    WeatherCity? weatherCity,
    String? errorMessage,
  }) {
    return HomePageState(
      status: status ?? _status,
      weatherCity: weatherCity ?? _weatherCity,
      errorMessage: errorMessage ?? _errorMessage,
    );
  }
}
