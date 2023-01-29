import 'dart:developer';

import 'package:flutter/material.dart';

import 'constants/enums/dialog_type_enums.dart';
import 'models/localization.dart';
import 'widgets/error_alert.dart';
import 'widgets/fail_alert.dart';
import 'widgets/info_alert.dart';
import 'widgets/progress_dialog.dart';
import 'widgets/success_alert.dart';

class FDialog extends InheritedWidget {
  FDialog({
    Key? key,
    required Widget child,
    required ThemeData theme,
  })  : _dialog = _Dialog(theme: theme),
        super(key: key, child: child);

  final _Dialog _dialog;

  void setLocalization(
          Localization localization) =>
      _dialog.localization = localization;

  Future show(
    BuildContext context, {
    required DialogTypeEnums dialogType,
  }) =>
      _dialog.show(
        context,
        dialogType: dialogType,
      );
  Future custom(
    BuildContext context, {
    required bool isDismissible,
    required Function onConfirm,
    required Function onCancel,
    required Icon icon,
    required String onConfirmText,
    required String onCancelText,
    required String customDialogTitle,
    required String customDialogBody,
    required TextStyle titleTextStyle,
    required TextStyle contentTextStyle,
    required ButtonStyle onConfirmButtonStyle,
    required ButtonStyle onCancelButtonStyle,
    required Color backgroundColor,
  }) =>
      _dialog.custom(
        context,
        icon,
        onConfirm: onConfirm,
        onCancel: onCancel,
        onConfirmText: onConfirmText,
        backgroundColor: backgroundColor,
        onCancelText: onCancelText,
        isDismissible: isDismissible,
        customDialogTitle: customDialogTitle,
        customDialogBody: customDialogBody,
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        onConfirmButtonStyle:
            onConfirmButtonStyle,
        onCancelButtonStyle: onCancelButtonStyle,
      );
  static void close(
    BuildContext context, [
    DialogTypeEnums? specificDialog,
  ]) {
    final dialog = FDialog.of(context)._dialog;

    dialog.hide(context, specificDialog);
  }

  void hide(
    BuildContext context, [
    DialogTypeEnums? specificDialog,
  ]) =>
      _dialog.hide(context, specificDialog);

  @override
  bool updateShouldNotify(
      covariant InheritedWidget oldWidget) {
    return false;
  }

  static dynamic of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<
          FDialog>();
}

class _Dialog {
  _Dialog({required this.theme});

  final ThemeData theme;
  late Localization localization;

  final List<DialogTypeEnums> activeDialogs = [];

  Future show(
    BuildContext context, {
    required DialogTypeEnums dialogType,
  }) {
    activeDialogs.add(dialogType);

    const isDismissible = false;

    _logger('$dialogType is shown.');

    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _getDialog(
            dialogType: dialogType,
            context: context,
          ),
        ),
      ),
    ).then((_) => activeDialogs.removeLast());
  }

  Future custom(
    BuildContext context,
    Icon icon, {
    required bool isDismissible,
    required Function onConfirm,
    required Function onCancel,
    required String onCancelText,
    required String onConfirmText,
    required String customDialogTitle,
    required String customDialogBody,
    required TextStyle titleTextStyle,
    required TextStyle contentTextStyle,
    required ButtonStyle onConfirmButtonStyle,
    required ButtonStyle onCancelButtonStyle,
    required Color backgroundColor,
  }) {
    _logger('Custom dialog is shown.');
    activeDialogs.add(DialogTypeEnums.custom);

    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: AlertDialog(
              backgroundColor: backgroundColor,
              icon: icon,
              title: Text(customDialogTitle),
              titleTextStyle: titleTextStyle,
              actionsOverflowButtonSpacing: 20,
              actions: [
                ElevatedButton(
                    style: onCancelButtonStyle,
                    onPressed: () => onCancel(),
                    child: Text(onCancelText)),
                ElevatedButton(
                    style: onConfirmButtonStyle,
                    onPressed: () => onConfirm(),
                    child: Text(onConfirmText)),
              ],
              content: Text(
                customDialogBody,
                style: contentTextStyle,
              ),
            )),
      ),
    ).then((_) => activeDialogs.removeLast());
  }

  void hide(BuildContext context,
      [DialogTypeEnums? specificDialog]) {
    if (activeDialogs.isNotEmpty) {
      if (specificDialog == null ||
          specificDialog == activeDialogs.last) {
        Navigator.pop(context);
        _logger(
            '(${specificDialog ?? activeDialogs.last}) is closed.');
      }
    }
  }

  Widget _getDialog({
    required DialogTypeEnums dialogType,
    required BuildContext context,
  }) {
    switch (dialogType) {
      case DialogTypeEnums.progress:
        return ProgressDialog(
          theme: theme,
          localization: localization,
        );

      case DialogTypeEnums.success:
        return SuccessAlert(
            localization: localization);

      case DialogTypeEnums.error:
        return ErrorAlert(
            localization: localization);
      case DialogTypeEnums.failed:
        return FailAlert(
            localization: localization);
      case DialogTypeEnums.info:
        return InfoAlert(
            localization: localization);
      default:
        return Container();
    }
  }

  void _logger(String message) =>
      log(message, name: 'f_dialog');
}
