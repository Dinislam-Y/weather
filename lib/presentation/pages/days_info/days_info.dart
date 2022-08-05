import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/presentation/pages/days_info/widgets/autosize_text.dart';

class DaysInfoScreen extends StatelessWidget {
  final String city;
  final String image;

  const DaysInfoScreen({
    Key? key,
    required this.city,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black45),
          ),
          Center(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: AutoSizeText(
                              style: TextStyle(color: Colors.white),

                              '123',
                              // "${state.info![index].dtTxt}",
                              maxFontSize: 14,
                              maxLines: 2,
                            ),
                          ),
                          CustomText(
                            text: "Температура: ",

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
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(thickness: 3);
              },
              itemCount: 3,
              // state.info!.length,
            ),
          ),
        ],
      ),
    );
  }
}
