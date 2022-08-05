// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/presentation/pages/home_page/bloc/home_page_cubit.dart';
import 'package:weather/theme/text_style.dart';

class SingleWeather extends StatelessWidget {
  const SingleWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          state.weatherCity!.name!,
                          style: AppTextStyle.title42bold(Colors.white),
                        ),
                        const SizedBox(width: 5),
                        Image.network(
                          "http://openweathermap.org/img/wn/"
                          "${state.weatherCity!.weather![0].icon!}"
                          "@2x.png",
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.weatherCity!.weather![0].description!,
                      style: AppTextStyle.title14bold(Colors.white),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${state.weatherCity!.main!.temp}",
                      style: AppTextStyle.title60bold(Colors.white),
                    ),
                    Text(
                      "\u2103",
                      style: AppTextStyle.title25bold(Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
