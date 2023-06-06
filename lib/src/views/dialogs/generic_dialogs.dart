import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/global/navigator_key.dart';

class GenericDialogs {
  static void showAlertDialog(String message, {Function? onConfirm}) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Atenção!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                if (onConfirm != null) {
                  onConfirm();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
