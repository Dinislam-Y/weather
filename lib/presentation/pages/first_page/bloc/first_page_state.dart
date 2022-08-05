part of 'first_page_cubit.dart';

// home screen states
enum FirstPageStatus {
  initial,
  loading,
  loaded,
}

class FirstPageState {
  final FirstPageStatus _status;
  final TextEditingController _cityController; // to get city name

  FirstPageState({
    required FirstPageStatus status,
    TextEditingController? cityController,
  })  : _status = status,
        _cityController = cityController ?? TextEditingController();

  TextEditingController get cityController => _cityController;

  FirstPageStatus get status => _status;

  FirstPageState copyWith({
    FirstPageStatus? status,
    TextEditingController? cityController,
  }) {
    return FirstPageState(
      status: status ?? _status,
      cityController: cityController ?? _cityController,
    );
  }
}
