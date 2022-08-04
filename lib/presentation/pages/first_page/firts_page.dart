// Flutter imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'widgets/autosize_text.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: Image.asset("assets/forecast.jpg"),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          '',
                          // "${state.info![index].dtTxt}",
                          // style: WeatherTextStyle.title18bold(
                          //   WeatherColors.black,
                          // ),
                          maxFontSize: 14,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(text: "Температура: "
                            // "${state.info![index].main!.temp}",
                            ),
                        CustomText(text: "Скорость ветра: "
                            // "${state.info![index].wind!.speed}",
                            ),
                        CustomText(text: "Видимость: "
                            // "${state.info![index].visibility}",
                            ),
                        CustomText(text: "Облачность: "
                            // "${state.info![index].clouds!.all}%",
                            ),
                        CustomText(text: "Влажность: "
                            // "${state.info![index].main!.humidity}%",
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(thickness: 3);
          },
          itemCount: 2),
    );
  }
}
