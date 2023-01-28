import 'package:flutter/material.dart';

import '../models/localization.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final Localization localization;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.done,
        size: 44.0,
      ),
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
