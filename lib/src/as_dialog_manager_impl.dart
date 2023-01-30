import 'dart:developer';
import 'package:as_dialog_manager/src/as_context_stack.dart';
import 'package:as_dialog_manager/src/as_dialog_manager.dart';
import 'package:flutter/material.dart';

class ASLogC {
  static String w = "ASDialogManager WARNING";
  static String i = "ASDialogManager INFO";
}

class ASDialogManager implements ASDialogManagerAbs {
  /// Singleton pattern.
  // 1. Private constructor.
  ASDialogManager._();

  // 2. Singular instance.
  static final ASDialogManager instance = ASDialogManager._();

  @override
  void hide() {
    BuildContext? lastContext = ASContextStack.instance.pop();

    if (lastContext == null) {
      log(
        "Trying to pop a context that doesn't exist",
        name: ASLogC.w,
      );
      return;
    }

    if (Navigator.canPop(lastContext)) {
      Navigator.pop(lastContext);
    }

    log(
      "No. of dialogs on the screen: ${ASContextStack.instance.count} ",
      name: ASLogC.i,
    );
  }

  @override
  Future<void> show(
    BuildContext context, {
    required Widget dialog,
    bool popLast = true,
  }) async {
    // 1. If pop last is true, only one dialog will shown in the screen at a
    // time.
    if (popLast) {
      BuildContext? previousContext = ASContextStack.instance.pop();
      if (previousContext != null) {
        if (Navigator.canPop(previousContext)) {
          Navigator.pop(previousContext);
        }
      }
    }

    await showDialog(
      context: context,
      builder: (dialogContext) {
        // 2. Add the context of the new dialog to the stack.
        ASContextStack.instance.push(dialogContext);
        log(
          "No. of dialogs on the screen: ${ASContextStack.instance.count} ",
          name: ASLogC.i,
        );
        return dialog;
      },
    );
  }
}
