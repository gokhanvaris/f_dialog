
```dart
import 'package:flutter/material.dart';

import 'f_dialog.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FDialog(
      theme: ThemeData(),
      child: MaterialApp(
        builder: (context, child) {
          FDialog.of(context)
              .setLocalization(const Localization(
            errorContent: 'Something went wrong',
            errorTitle: 'Opps!',
            failedContent: 'Your process failed.',
            failedTitle: 'Failed',
            infoContent: 'This is a info body',
            onCancelText: 'Cancel',
            infoTitle: 'Info',
            onConfirmText: 'OK',
            processingContent: 'Processing...',
            processingTitle: 'Process',
            successTitle: 'Success',
            successContent:
                'Your process has been successfully completed',
          ));
          return const Scaffold(
            body: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('home'),
        InkWell(
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
          onTap: () {
            FDialog.of(context).custom(
              context,
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.red,
              ),
              backgroundColor: Colors.white,
              isDismissible: false,
              customDialogTitle:
                  'Custom Dialog Title',
              customDialogBody:
                  'Custom Dialog Body',
              onConfirmText: 'OK',
              onCancelText: 'NO',
              onConfirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(
                          Colors.green)),
              onCancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(
                          Colors.red)),
              contentTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 20),
              onCancel: () {
                Navigator.pop(context);
              },
              onConfirm: () {
                Navigator.pop(context);
              },
            );
          },
        )
      ],
    );
  }
}

```