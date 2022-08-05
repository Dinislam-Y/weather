// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'first_page_state.dart';

class FirstHomeCubit extends Cubit<FirstPageState> {
  FirstHomeCubit() : super(FirstPageState(status: FirstPageStatus.initial));


}
