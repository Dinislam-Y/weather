// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/presentation/pages/days_info/days_info.dart';

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
    // String bgImg = '';

    // if(locationList[currentPage].weatherType == 'Sunny') {
    //   bgImg = 'assets/sunny.jpg';
    // } else if(locationList[currentPage].weatherType == 'Night') {
    //   bgImg = 'assets/night.jpg';
    // } else if(locationList[currentPage].weatherType == 'Rainy') {
    //   bgImg = 'assets/rainy.jpg';
    // } else if(locationList[currentPage].weatherType == 'Cloudy') {
    //   bgImg = 'assets/cloudy.jpeg';
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
                      builder: (context) => DaysInfoScreen(city: city),
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
}
