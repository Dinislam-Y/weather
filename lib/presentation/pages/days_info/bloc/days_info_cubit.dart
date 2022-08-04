import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'days_info_state.dart';

class DaysInfoCubit extends Cubit<DaysInfoState> {
  DaysInfoCubit() : super(DaysInfoInitial());
}
