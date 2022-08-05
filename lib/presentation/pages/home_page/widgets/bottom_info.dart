// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/presentation/pages/home_page/bloc/home_page_cubit.dart';
import 'package:weather/theme/text_style.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Скорость ветра",
                        style: AppTextStyle.title14bold(Colors.white),
                      ),
                      Text(
                        "${state.weatherCity!.wind!.speed} km/h",
                        style: AppTextStyle.title25bold(Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Влажность',
                        style: AppTextStyle.title14bold(Colors.white),
                      ),
                      Text(
                        "${state.weatherCity!.main!.humidity} %",
                        style: AppTextStyle.title25bold(Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Давление',
                        style: AppTextStyle.title14bold(Colors.white),
                      ),
                      Text(
                        "${state.weatherCity!.main!.pressure}",
                        style: AppTextStyle.title25bold(Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
