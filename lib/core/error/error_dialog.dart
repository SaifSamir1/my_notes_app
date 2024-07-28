import 'package:flutter/material.dart';

class ErrorDialog {
  static void showErrorDialog(BuildContext context, String title,
      String message, void Function()? onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Row(
            children: [
              const Icon(Icons.error, color: Colors.red),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: onPressed,
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cansel', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
