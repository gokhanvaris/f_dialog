import 'package:flutter/material.dart';

import '../models/localization.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({
    Key? key,
    required this.theme,
    required this.localization,
    this.content,
  }) : super(key: key);

  final ThemeData theme;
  final Localization localization;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0))),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Text(content ??
                localization.processingContent),
          ],
        ));
  }
}
