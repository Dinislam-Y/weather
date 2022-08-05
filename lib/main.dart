// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/data/repositories/days_info_repository.dart';
import 'package:weather/data/repositories/today_repository.dart';
import 'package:weather/presentation/pages/first_page/bloc/first_page_cubit.dart';
import 'package:weather/presentation/pages/first_page/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => TodayRepository(),
        ),
        RepositoryProvider(
          create: (BuildContext context) => DaysInfoRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => FirstHomeCubit()),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const FirstPage(),
          },
        ),
      ),
    );
  }
}
