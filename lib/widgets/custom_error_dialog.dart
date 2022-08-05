// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//showDialog called on error
class CustomErrorDialog {
  static Future<void> show({
    required BuildContext context,
    required String errorMessage,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Ошибка получения данных"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}
