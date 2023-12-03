import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:yaksisi/screen/schedule_write_screen/widget/memo.dart';
import 'widget/group_button.dart';
import 'widget/pill_name_textfield.dart';

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
                    onChanged: changePillName,
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
                  _Memo(onChanged: changeMemo,memo: memo,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String pillName = '';

  // pillName 입력값 받는 콜백
  void changePillName(value) {
    setState(() {
      pillName = value;
    });
  }

  String memo = '';

  // memo 입력값 받는 콜백
  void changeMemo(value) {
    setState(() {
      memo = value;
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
    List<String> buttonLables = ['1정', '2정', '3정', '4정'];
    List<int> buttonValues = [1, 2, 3, 4];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return _Frame(
      contentTitle: "투약 개수",
      middleContent: Row(
        children: [
          GroupButton(
            buttonWidth: width * 0.14,
            buttonLables: buttonLables,
            buttonValues: buttonValues,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> dayNumder = ['일 1회', '일 2회', '일 3회'];
    List<int> dayValue = [1, 2, 3];

    return _Frame(
      contentTitle: "투약 횟수 선택",
      middleContent: Row(
        children: [
          GroupButton(
            buttonWidth: width * 0.2,
            buttonLables: dayNumder,
            buttonValues: dayValue,
          ),
        ],
      ),
    );
  }
}

// 투약 요일 선택
class _SelectDay extends StatelessWidget {
  const _SelectDay({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> dayOfTheWeek1 = [
      '월',
      '화',
      '수',
      '목',
    ];
    List<int> value1 = [
      1,
      2,
      3,
      4,
    ];
    List<String> dayOfTheWeek2 = [
      '금',
      '토',
      '일',
    ];
    List<int> value2 = [
      1,
      2,
      3,
    ];
    return _Frame(
      contentTitle: "투약 요일 선택",
      middleContent: Column(
        children: [
          GroupButton2(
            buttonWidth: width * 0.12,
            buttonLables: dayOfTheWeek1,
            buttonValueList: value1,
          ),
          GroupButton2(
            buttonWidth: width * 0.12,
            buttonLables: dayOfTheWeek2,
            buttonValueList: value2,
          )
        ],
      ),
    );
  }
}

// 투약 시간 선택
class _SelectTime extends StatelessWidget {
  const _SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(contentTitle: "투약 시간 선택", middleContent: Container());
  }
}

class _Memo extends StatelessWidget {
  final ValueChanged onChanged;
  final String memo;

  const _Memo({required this.onChanged, required this.memo, super.key});

  @override
  Widget build(BuildContext context) {
    return _Frame(
      contentTitle: "메모",
      middleContent: Memo(
        onChanged: onChanged,
        memo: memo,
      ),
    );
  }
}
