<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->



## Features

Info Dialog, 
Progress Dialog, 
Success Dialog, 
Fail Dialog, 
Error Dialog,

<br><br>
to use the desired dialog type on the desired screen and to close it according to the dialog type on the screen.

Dialogs contents support localization.

## Images








## Usage


to `main.dart` file.

```dart
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
```

## To create a dialog

```dart
   FDialog.of(context).show(
              context,
              dialogType:
                  DialogTypeEnums.progress,
            );
```

## To close the last Dialog shown on the screen.

```dart
  FDialog.close(context);
```
## To close a specific dialog that appears on the screen.

```dart
  FDialog.close(context,
                  DialogTypeEnums.progress);
```

## TODO
More dialog types and custom features will be added.

