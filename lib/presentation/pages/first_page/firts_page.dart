// Flutter imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../days_info/widgets/autosize_text.dart';

class FirstPage extends StatelessWidget {
  final String city;
  final String image;

  const FirstPage({
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                      width: 5,
                    ),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Введите город",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    ),
                  ),
                  // controller: state.cityController,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 200,
                  decoration: const BoxDecoration(color: Colors.black45),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white54, // background
                      onPrimary: Colors.black, // foreground
                    ),
                    onPressed: () {
                      // if (state.cityController.text.isNotEmpty) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => WeatherScreen(
                      //         city: state.cityController.text,
                      //       ),
                      //     ),
                      //   );
                      // } else {
                      //   CustomDialog.show(context: context);
                    },
                    // },
                    child: const Text("Поиск"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
