import 'package:flutter/material.dart';

import '../f_dialog.dart';

extension SmartDialogBuildContextExtension
    on BuildContext {
  FDialog get dialog => FDialog.of(this);
}
