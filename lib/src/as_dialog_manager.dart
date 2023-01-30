import 'package:flutter/cupertino.dart';

abstract class ASDialogManagerAbs {
  
  /// Method to show a dialog.
  ///
  /// [dialog]: Pass in the widget to be the shown as the dialog.
  ///
  /// [popLast]: Displays only a single dialog on the screen at a time.
  Future<void> show(BuildContext context,{required Widget dialog, bool popLast = false});
  
  /// Method to hide the current dialog. 
  void hide();
}
