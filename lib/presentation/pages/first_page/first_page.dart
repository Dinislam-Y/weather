// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:weather/presentation/pages/first_page/bloc/first_page_cubit.dart';
import 'package:weather/presentation/pages/home_page/home_page.dart';
import 'package:weather/theme/text_style.dart';
import 'package:weather/widgets/custom_dialog.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstHomeCubit, FirstPageState>(
      builder: (context, state) {
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
                'assets/night.jpeg',
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
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: state.cityController,
                        decoration: const InputDecoration(
                          hintText: "Введите город",
                          hintStyle: TextStyle(color: Colors.black45),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 200,
                      decoration: const BoxDecoration(color: Colors.black45),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white54,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () {
                          if (state.cityController.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(city: state.cityController.text),
                              ),
                            );
                          } else {
                            CustomDialog.show(context: context);
                          }
                        },
                        child: Text(
                          "Поиск",
                          style: AppTextStyle.title18bold(Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
