import 'package:flutter/material.dart';

class CustomSnackbars {
  final BuildContext context;
  final Duration _duration = Duration(seconds: 3);

  CustomSnackbars(this.context);

  void showUnexpectedSnackbar() => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: _duration, content: Text('Something went wrong!')),
      );

  void showMessageSnackbar(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: _duration,
          content: Text(
            message,
            style: Theme.of(context).textTheme.caption?.apply(
                  fontWeightDelta: 1,
                  fontSizeDelta: -2,
                  color: Colors.white,
                ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );

  void showSuccessMessageSnackbar(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: _duration,
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              Text(
                ' $message',
                style: Theme.of(context).textTheme.caption?.apply(
                      fontWeightDelta: 1,
                      fontSizeDelta: -2,
                      color: Colors.white,
                    ),
              )
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
}
