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
Custom Action Dialog,

<br><br>
to use the desired dialog type on the desired screen and to close it according to the dialog type on the screen.

Dialogs contents support localization.

## NOTE 

You don't need to add localization under material app when using custom dialog. Where you use Custom Dialog you can add these fields from your localization variable or file.
## Images


<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/1.png" alt="" width="200"></td>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/2.png" alt="" width="200"></td>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/3.png" alt="" width="200"></td>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/4.png" alt="" width="200"></td>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/5.png" alt="" width="201"></td>
    <td><img src="https://raw.githubusercontent.com/gokhanvaris/f_dialog/main/6.png" alt="" width="201"></td>




  </tr>
</table>





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
   FDialog.of(context)?.show(
              context,
              dialogType: DialogTypeEnums.success,
              icon: const Icon(
                Icons.safety_check_rounded,
              ),
              customPadding:
                  const EdgeInsets.all(20),
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

## To create custom dialog
```dart
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
```

## TODO
More dialog types and custom features will be added.

