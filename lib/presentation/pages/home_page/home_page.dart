// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/data/repositories/today_repository.dart';
import 'package:weather/presentation/pages/days_info/days_info.dart';
import 'package:weather/presentation/pages/first_page/first_page.dart';
import 'package:weather/presentation/pages/home_page/bloc/home_page_cubit.dart';
import 'widgets/bottom_info.dart';
import 'widgets/single_weather.dart';

class HomePage extends StatelessWidget {
  final String city;

  const HomePage({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomePageCubit(repository: TodayRepository()),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state.status == HomePageStatus.initial) {
            context.read<HomePageCubit>().getWeather(city: city);
          }
          if (state.status == HomePageStatus.loaded) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DaysInfoScreen(
                                city: city,
                                image: 'assets/night.jpeg',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.thunderstorm_rounded,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Image.asset(
                    'assets/night.jpeg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.black45),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SingleWeather(),
                      BottomInfo(),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
