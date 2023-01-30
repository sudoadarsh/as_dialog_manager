import 'package:as_dialog_manager/as_dialog_manager.dart';
import 'package:flutter/material.dart';

class ASDialogTest2 extends StatefulWidget {
  const ASDialogTest2({Key? key}) : super(key: key);

  @override
  State<ASDialogTest2> createState() => _ASDialogTest2State();
}

class _ASDialogTest2State extends State<ASDialogTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text("Show overlapping dialogs"),
            onPressed: () async {
              ASDialogManager.instance.show(
                context,
                dialog: const AlertDialog(
                  content: Text("Another dialog will be shown over this one."),
                ),
                popLast: false,
              );

              await Future.delayed(
                const Duration(seconds: 3),
                () {
                  ASDialogManager.instance.show(
                    context,
                    dialog: const AlertDialog(
                      content: Text(
                        "This is the overlapping dialog",
                      ),
                    ),
                    popLast: false
                  );
                },
              );

              await Future.delayed(const Duration(seconds: 3), () {
                ASDialogManager.instance.hide();
              });

              await Future.delayed(const Duration(seconds: 3), () {
                ASDialogManager.instance.hide();
              });
            },
          ),
        ),
      ),
    );
  }
}
