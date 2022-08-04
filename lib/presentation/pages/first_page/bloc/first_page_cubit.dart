import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_page_state.dart';

class FirstPageCubit extends Cubit<FirstPageState> {
  FirstPageCubit() : super(FirstPageInitial());
}
