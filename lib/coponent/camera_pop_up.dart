import 'package:flutter/material.dart';

class CameraPopUp extends StatelessWidget {
  const CameraPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      // 배경색
      backgroundColor: const Color(0x00FFFFFF),
      // 어디 생성될지
      alignment: Alignment(width * 0.006,height * 0.00088),
      // 주축
      actionsAlignment: MainAxisAlignment.center,
      // 팝업 안 요소들
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TextButton(titleText: "카메라 촬영"),
          Container(
            color: Color(0xff616161),
            width: width * 0.3,
            height: height * 0.001,
          ),
          _TextButton(titleText: "직접 작성"),
        ],
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  final String titleText;

  const _TextButton({required this.titleText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3D3D3D),
      ),
      child: Text(
        titleText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
