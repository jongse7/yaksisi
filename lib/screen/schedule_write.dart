import 'package:flutter/material.dart';

class ScheduleWrite extends StatelessWidget {
  const ScheduleWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Title(),
                  _Line(),
                  _PillName(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 구분선
class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color(0xff414141),
      width: double.infinity,
      height: height * 0.002,
    );
  }
}

// 제목
class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        child: Text(
          "투약 정보 입력",
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.07,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 약 이름
class _PillName extends StatelessWidget {
  const _PillName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: Text(
            "약 이름",
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {FocusScope.of(context).requestFocus(FocusNode());},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                ),
              ),
              child: Text(
                '약',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {

              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                "수정",
                style: TextStyle(
                  color: Color(0xff51EE60),
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
