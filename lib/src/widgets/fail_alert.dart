import 'package:f_dialog/f_dialog.dart';
import 'package:flutter/material.dart';

class FailAlert extends StatelessWidget {
  const FailAlert({
    required this.localization,
    required this.icon,
  });

  final Localization localization;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      iconColor: Colors.yellow,
      title: Text(localization.failedTitle),
      content: Text(localization.failedContent),
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
