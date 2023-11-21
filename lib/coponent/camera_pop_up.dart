import 'package:flutter/material.dart';

class CameraPopUp extends StatelessWidget {
  const CameraPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const  EdgeInsets.fromLTRB(0,80,0, 80),
      alignment: Alignment.bottomRight,
      actions: [
        TextButton(
          child: const Text('확인'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
