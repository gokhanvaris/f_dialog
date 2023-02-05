import 'package:f_dialog/f_dialog.dart';
import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    required this.localization,
    required this.icon,
  });

  final Localization localization;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      iconColor: Colors.red,
      title: Text(localization.errorTitle),
      content: Text(localization.errorContent),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            localization.onConfirmText,
          ),
        )
      ],
    );
  }
}
