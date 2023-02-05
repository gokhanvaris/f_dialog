import 'package:f_dialog/f_dialog.dart';
import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({
    required this.localization,
    required this.icon,
  });

  final Localization localization;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      iconColor: Colors.green,
      title: Text(localization.successTitle),
      content: Text(localization.successContent),
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
