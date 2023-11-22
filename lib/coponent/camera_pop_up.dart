import 'package:flutter/material.dart';

class CameraPopUp extends StatelessWidget {
  const CameraPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color(0xff3D3D3D),
      alignment: Alignment.bottomRight,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            child: const Text(
              '카메라 촬영',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Container(
            color: Color(0xff616161),
            width: width * 0.3,
            height: height * 0.001,
          ),
          TextButton(
            child: const Text('직접 작성'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
