import 'package:flutter/material.dart';

import '../models/localization.dart';

class InfoAlert extends StatelessWidget {
  const InfoAlert({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final Localization localization;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.info,
        size: 44.0,
      ),
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
