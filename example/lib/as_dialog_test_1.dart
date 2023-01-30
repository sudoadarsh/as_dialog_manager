import 'package:as_dialog_manager/as_dialog_manager.dart';
import 'package:flutter/material.dart';

class ASDialogTest1 extends StatefulWidget {
  const ASDialogTest1({Key? key}) : super(key: key);

  @override
  State<ASDialogTest1> createState() => _ASDialogTest1State();
}

class _ASDialogTest1State extends State<ASDialogTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              ASDialogManager.instance.show(
                context,
                dialog: AlertDialog(
                  content: StreamBuilder(
                    stream: _seconds(),
                    builder: (context, snapshot) {
                      return Text(
                          "This dialog will be popped in ${snapshot.data ?? 5} seconds");
                    },
                  ),
                ),
              );

              // To hide the dialog.
              await Future.delayed(const Duration(seconds: 5), () {
                ASDialogManager.instance.hide();
              });

              if (!mounted) return;

              await Future.delayed(const Duration(seconds: 1), () {
                ASDialogManager.instance.show(
                  context,
                  dialog: AlertDialog(
                    content: StreamBuilder(
                      stream: _seconds(),
                      builder: (context, snapshot) {
                        return Text(
                            "This new dialog will be popped in ${snapshot.data ?? 5} seconds");
                      },
                    ),
                  ),
                );
              });

              // To hide the dialog.
              await Future.delayed(const Duration(seconds: 5), () {
                ASDialogManager.instance.hide();
              });
            },
            child: const Text("Show dialog"),
          ),
        ),
      ),
    );
  }

  /// Method that provides a stream of int.
  Stream _seconds() async* {
    int count = 5;
    while (count >= 0) {
      await Future.delayed(const Duration(seconds: 1));
      count--;
      yield count;
    }
  }
}