part of 'first_page_cubit.dart';

// weather screen states
enum FirstPageStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class FirstPageState {
  final FirstPageStatus _status;
  final WeatherCity? _weatherCity;
  final String? _errorMessage; // server error

  const FirstPageState({
    required FirstPageStatus status,
    WeatherCity? weatherCity,
    String? errorMessage,
  })  : _status = status,
        _weatherCity = weatherCity,
        _errorMessage = errorMessage;

  String? get errorMessage => _errorMessage;

  WeatherCity? get weatherCity => _weatherCity;

  FirstPageStatus get status => _status;

  FirstPageState copyWith({
    FirstPageStatus? status,
    WeatherCity? weatherCity,
    String? errorMessage,
  }) {
    return FirstPageState(
      status: status ?? _status,
      weatherCity: weatherCity ?? _weatherCity,
      errorMessage: errorMessage ?? _errorMessage,
    );
  }
}
