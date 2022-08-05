part of 'first_page_cubit.dart';

//home screen states
enum FirstPageStatus {
  initial,
  loading,
  loaded,
}

class FirstPageState {
  final FirstPageStatus _status;

  //get city name
  final TextEditingController _cityController;

  //удаление пробела
  final FocusNode _node;

  FirstPageState({
    required FirstPageStatus status,
    TextEditingController? cityController,
    FocusNode? node,
  })  : _status = status,
        _cityController = cityController ?? TextEditingController(),
        _node = node ?? FocusNode();

  TextEditingController get cityController => _cityController;

  FirstPageStatus get status => _status;

  FocusNode get node => _node;

  FirstPageState copyWith({
    FirstPageStatus? status,
    TextEditingController? cityController,
    FocusNode? node,
  }) {
    return FirstPageState(
      status: status ?? _status,
      cityController: cityController ?? _cityController,
      node: node ?? _node,
    );
  }
}
