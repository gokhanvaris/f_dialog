import 'package:flutter/material.dart';

import '../models/localization.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final Localization localization;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        size: 44.0,
      ),
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
