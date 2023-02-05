import 'package:f_dialog/src/f_dialog.dart';
import 'package:flutter/material.dart';

extension FDialogBuildContextExtension
    on BuildContext {
  FDialog? get dialog => FDialog.of(this);
}
