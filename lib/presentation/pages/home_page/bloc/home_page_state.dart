part of 'home_page_cubit.dart';

enum HomePageStatus {
  initial,
  loading,
  loaded,
}

class HomePageState {
  final HomePageStatus _status;
  final TextEditingController _cityController; // to get city name

  HomePageState({
    required HomePageStatus status,
    TextEditingController? cityController,
  })  : _status = status,
        _cityController = cityController ?? TextEditingController();

  TextEditingController get cityController => _cityController;

  HomePageStatus get status => _status;

  HomePageState copyWith({
    HomePageStatus? status,
    TextEditingController? cityController,
  }) {
    return HomePageState(
      status: status ?? _status,
      cityController: cityController ?? _cityController,
    );
  }
}
