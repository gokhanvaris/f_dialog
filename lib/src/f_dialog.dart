import 'dart:developer';

import 'package:f_dialog/f_dialog.dart';
import 'package:flutter/material.dart';

class FDialog extends InheritedWidget {
  FDialog({
    super.key,
    required super.child,
    required ThemeData theme,
  }) : _dialog = _Dialog(theme: theme);

  final _Dialog _dialog;

  Localization setLocalization(
    Localization localization,
  ) =>
      _dialog.localization = localization;

  Future show(
    BuildContext context, {
    Icon? icon,
    EdgeInsetsGeometry? customPadding =
        const EdgeInsets.all(10),
    required DialogTypeEnums dialogType,
  }) =>
      _dialog.show(
        context,
        dialogType: dialogType,
        customPadding ?? const EdgeInsets.all(20),
        icon,
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
    final dialog = FDialog.of(context)?._dialog;

    dialog?.hide(context, specificDialog);
  }

  void hide(
    BuildContext context, [
    DialogTypeEnums? specificDialog,
  ]) =>
      _dialog.hide(context, specificDialog);

  @override
  bool updateShouldNotify(
    covariant InheritedWidget oldWidget,
  ) {
    return false;
  }

  static FDialog? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<
          FDialog>();
}

class _Dialog {
  _Dialog({required this.theme});

  final ThemeData theme;
  late Localization localization;
  final List<DialogTypeEnums> activeDialogs = [];

  Future show(
    BuildContext context,
    EdgeInsetsGeometry? customPadding,
    Icon? icon, {
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
          padding: customPadding ??
              const EdgeInsets.all(20),
          child: _getDialog(
            icon: icon ??
                _getIcon(dialogType: dialogType),
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
                child: Text(onCancelText),
              ),
              ElevatedButton(
                style: onConfirmButtonStyle,
                onPressed: () => onConfirm(),
                child: Text(onConfirmText),
              ),
            ],
            content: Text(
              customDialogBody,
              style: contentTextStyle,
            ),
          ),
        ),
      ),
    ).then((_) => activeDialogs.removeLast());
  }

  void hide(
    BuildContext context, [
    DialogTypeEnums? specificDialog,
  ]) {
    if (activeDialogs.isNotEmpty) {
      if (specificDialog == null ||
          specificDialog == activeDialogs.last) {
        Navigator.pop(context);
        _logger(
          '(${specificDialog ?? activeDialogs.last}) is closed.',
        );
      }
    }
  }

  Icon _getIcon({
    required DialogTypeEnums dialogType,
  }) {
    switch (dialogType) {
      case DialogTypeEnums.success:
        return const Icon(
          Icons.done,
          size: 44,
        );

      case DialogTypeEnums.error:
        return const Icon(
          Icons.error,
          size: 44,
        );
      case DialogTypeEnums.failed:
        return const Icon(
          Icons.warning,
          size: 44,
        );
      case DialogTypeEnums.info:
        return const Icon(
          Icons.info,
          size: 44,
        );

      // ignore: no_default_cases
      default:
        return const Icon(Icons.abc);
    }
  }

  Widget _getDialog({
    required DialogTypeEnums dialogType,
    required BuildContext context,
    required Icon icon,
  }) {
    switch (dialogType) {
      case DialogTypeEnums.progress:
        return ProgressDialog(
          theme: theme,
          localization: localization,
        );

      case DialogTypeEnums.success:
        return SuccessAlert(
          icon: icon,
          localization: localization,
        );

      case DialogTypeEnums.error:
        return ErrorAlert(
          icon: icon,
          localization: localization,
        );
      case DialogTypeEnums.failed:
        return FailAlert(
          icon: icon,
          localization: localization,
        );
      case DialogTypeEnums.info:
        return InfoAlert(
          icon: icon,
          localization: localization,
        );

      default:
        return Container();
    }
  }

  void _logger(String message) =>
      log(message, name: 'f_dialog');
}
