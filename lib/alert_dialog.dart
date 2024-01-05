import 'package:flutter/material.dart';
class Alert {
  Future<void> alertDialogEx(BuildContext context, int correct, int incorrect) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('TEBRİKLER TESTİ BİTİRDİNİZ!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Doğru sayınız: $correct"),
                Text("Yanlış sayınız: $incorrect"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Başa Dön'),
              onPressed: () {
                // Do something when 'Tamam' button is pressed
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

