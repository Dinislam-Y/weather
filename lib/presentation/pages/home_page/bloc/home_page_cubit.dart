import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_page_state.dart';

class HomeCubit extends Cubit<HomePageState> {
  HomeCubit() : super(HomePageState(status: HomePageStatus.initial));
}
