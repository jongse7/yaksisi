import 'package:flutter/material.dart';

import '../coponent/pill_name_textfield.dart';

class ScheduleWrite extends StatefulWidget {
  const ScheduleWrite({Key? key}) : super(key: key);

  @override
  State<ScheduleWrite> createState() => _ScheduleWriteState();
}

class _ScheduleWriteState extends State<ScheduleWrite> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Title(),
                  _Line(),
                  _PillName(
                    onChanged: changeSearchText,
                    pillName: pillName,
                  ),
                  _Line(),
                  _Duration(),
                  _Line(),
                  VariousOfPills(),
                  _Line(),
                  _SelectPillNumber(),
                  _Line(),
                  _SelectDay(),
                  _Line(),
                  _SelectTime(),
                  _Line(),
                  _Memo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String pillName = '';

  // textfield 입력값 받는 콜백
  void changeSearchText(value) {
    setState(() {
      pillName = value;
    });
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

// content 틀

class _Frame extends StatelessWidget {
  final String contentTitle;
  final Widget middleContent;

  const _Frame(
      {required this.contentTitle, required this.middleContent, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.035, bottom: height * 0.02),
          child: Text(
            contentTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        middleContent,
        SizedBox(
          height: height * 0.05,
        ),
      ],
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
  final ValueChanged onChanged;
  final String pillName;

  const _PillName({required this.onChanged, required this.pillName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _Frame(
      contentTitle: '약 이름',
      middleContent: Row(
        children: [
          PillNameTextField(
            onChanged: onChanged,
            pillName: pillName,
          ),
        ],
      ),
    );
  }
}

// 투약 기간
class _Duration extends StatelessWidget {
  const _Duration({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _Frame(
      contentTitle: "투약 기간",
      middleContent: Container(),
    );
  }
}

// 투약 개수
class VariousOfPills extends StatelessWidget {
  const VariousOfPills({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _Frame(
      contentTitle: "투약 개수",
      middleContent: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('1정'),
          ),
        ],
      ),
    );
  }
}

// 투약 횟수 선택
class _SelectPillNumber extends StatelessWidget {
  const _SelectPillNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(
      contentTitle: "투약 횟수 선택",
      middleContent: Container(),
    );
  }
}

// 투약 요일 선택
class _SelectDay extends StatelessWidget {
  const _SelectDay({super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(
      contentTitle: "투약 요일 선택",
      middleContent: Container(),
    );
  }
}

// 투약 시간 선택
class _SelectTime extends StatelessWidget {
  const _SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(
      contentTitle: "투약 시간 선택",
      middleContent: Container(),
    );
  }
}

class _Memo extends StatelessWidget {
  const _Memo({super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(
      contentTitle: "메모",
      middleContent: Container(),
    );
  }
}
