import 'package:flutter/material.dart';

import '../models/localization.dart';

class FailAlert extends StatelessWidget {
  const FailAlert({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final Localization localization;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.warning,
        size: 44.0,
      ),
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
