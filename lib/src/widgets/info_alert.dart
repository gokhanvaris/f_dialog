import 'package:f_dialog/f_dialog.dart';
import 'package:flutter/material.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({
    required this.localization,
    required this.icon,
  });

  final Localization localization;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      iconColor: Colors.blue,
      title: Text(localization.infoTitle),
      content: Text(localization.infoContent),
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
