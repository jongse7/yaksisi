import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:yaksisi/screen/schedule_write_screen/widget/memo.dart';
import '../../coponent/navigator_bar.dart';
import '../calendar_screen/model/marker_model.dart';
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
                  _Duration(
                    startDay: startDay,
                    endDay: endDay,
                    onPressedStartDay: _selectStartDay,
                    onPressedEndDay: _selectEndDay,
                  ),
                  _Line(),
                  VariousOfPills(
                    onChanged: changePillVarious,
                  ),
                  _Line(),
                  _SelectPillNumber(
                    onChanged: changePillNumber,
                  ),
                  _Line(),
                  _SelectDay(valueChanged: changePillDay,),
                  _Line(),
                  _SelectTime(pillNumber: pillNumber),
                  _Line(),
                  _Memo(
                    onChanged: changeMemo,
                    memo: memo,
                  ),
                  _CancelAndStoreButton(dosage: dosage,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> dosage = {
    "약 이름": "",
    "시작일": DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
    "종료일": DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day + 7),
    "투약 개수": 0,
    "투약 횟수": 0,
    "투약 요일": [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
    ],
    "투약 시간": "",
    "메모": "",
  };

  String pillName = '';

  // pillName 입력값 받는 콜백
  void changePillName(value) {
    setState(() {
      pillName = value;
      dosage["약 이름"] = pillName;
    });
  }

  // 투약 기간, 시작일, 종료일
  DateTime startDay = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  DateTime endDay = DateTime(DateTime.now().year,DateTime.now().month, DateTime.now().day + 7);

  Future<void> _selectStartDay() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: startDay,
      firstDate: DateTime.now(), // 시작 날짜는 현재 날짜 이후여야 함
      lastDate: DateTime.now().add(Duration(days: 365 * 2)), // 2년 후까지만 선택 가능
    );
    if (selectedDate != null) {
      setState(() {
        startDay = selectedDate;
        dosage["시작일"] = startDay;
      });
    }
  }

  Future<void> _selectEndDay() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: startDay,
      firstDate: startDay, // 시작 날짜는 startDay 이후여야 함
      lastDate: startDay.add(Duration(days: 365 * 2)), // startDay 2년 후까지만 선택 가능
    );
    if (selectedDate != null) {
      setState(() {
        endDay = selectedDate;
        dosage["종료일"] = endDay;
      });
    }
  }

  String memo = '';


  // 투약 개수 입력
  int pillVarious = 0;

  void changePillVarious(value) {
    setState(() {
      pillVarious = value;
      dosage["투약 개수"] = pillVarious;
    });
  }

  // 투약 횟수 입력
  int pillNumber = 0;

  void changePillNumber(value) {
    setState(() {
      pillNumber = value;
      dosage["투약 횟수"] = pillNumber;
    });
  }

  // 투약 요일 선택

  var pillDay1 = [];
  var pillDay2 = [];

  void changePillDay(value) {
    setState(() {
      pillDay1 = value;
      pillDay2 = value;
      List<int> pillDay = [];
      pillDay.addAll(pillDay1 as Iterable<int>);
      pillDay.addAll(pillDay2 as Iterable<int>);
      dosage["투약 요일"] = pillDay;
    });
  }

  // memo 입력값 받는 콜백
  void changeMemo(value) {
    setState(() {
      memo = value;
      dosage["메모"] = memo;
    });
  }

}

// 구분선
class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.035, bottom: height * 0.02),
          child: Text(
            contentTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w800,
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
  final DateTime startDay;
  final DateTime endDay;
  final VoidCallback onPressedStartDay;
  final VoidCallback onPressedEndDay;

  const _Duration({required this.startDay,
    required this.endDay,
    required this.onPressedStartDay,
    required this.onPressedEndDay,
    super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return _Frame(
      contentTitle: "투약 기간",
      middleContent: Column(
        children: [
          Row(
            children: [
              Text(
                '시작 날짜',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(
                    color: Colors.white,
                    width: width * 0.002,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.025),
                    ),
                  ),
                ),
                onPressed: onPressedStartDay,
                child: Text(
                  "${startDay.year.toString()}-${startDay.month.toString()
                      .padLeft(2, '0')}-${startDay.day.toString().padLeft(
                      2, '0')}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '종료 날짜',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: width * 0.045,
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(
                    color: Colors.white,
                    width: width * 0.002,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.025),
                    ),
                  ),
                ),
                onPressed: onPressedEndDay,
                child: Text(
                  "${endDay.year.toString()}-${endDay.month.toString().padLeft(
                      2, '0')}-${endDay.day.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 투약 개수
class VariousOfPills extends StatelessWidget {
  final ValueChanged onChanged;

  const VariousOfPills({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttonLables = ['1정', '2정', '3정', '4정'];
    List<int> buttonValues = [1, 2, 3, 4];
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return _Frame(
      contentTitle: "투약 개수",
      middleContent: Row(
        children: [
          GroupButton(
            valueChanged: onChanged,
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
  final ValueChanged onChanged;

  const _SelectPillNumber({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    List<String> dayNumder = ['일 1회', '일 2회', '일 3회'];
    List<int> dayValue = [1, 2, 3];

    return _Frame(
      contentTitle: "투약 횟수 선택",
      middleContent: Row(
        children: [
          GroupButton(
            valueChanged: onChanged,
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
  final ValueChanged valueChanged;

  const _SelectDay({required this.valueChanged, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    List<String> dayOfTheWeek1 = [
      '월',
      '화',
      '수',
      '목',
    ];
    List<int> value1 = [
      0,
      1,
      2,
      3,
    ];
    List<String> dayOfTheWeek2 = [
      '금',
      '토',
      '일',
    ];
    List<int> value2 = [
      4,
      5,
      6,
    ];
    return _Frame(
      contentTitle: "투약 요일 선택",
      middleContent: Column(
        children: [
          GroupButton2(
            valueChanged: valueChanged,
            buttonWidth: width * 0.12,
            buttonLables: dayOfTheWeek1,
            buttonValueList: value1,
          ),
          GroupButton2(
            valueChanged: valueChanged,
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
  final int pillNumber;

  const _SelectTime({required this.pillNumber, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return _Frame(
      contentTitle: "투약 시간 선택",
      middleContent: SizedBox(
        width: width * 0.1,
        height: height * 0.12,
        child: ListView.builder(
          itemCount: pillNumber,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: height * 0.02),
              child: Row(
                children: [
                  Text(
                    '시간${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
      middleContent: Center(
        child: Memo(
          onChanged: onChanged,
          memo: memo,
        ),
      ),
    );
  }
}

class _CancelAndStoreButton extends StatelessWidget {
  final Map<String, dynamic> dosage;
  const _CancelAndStoreButton({required this.dosage, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4D4D4D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.025),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '취소',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff51EE60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.025),
                  ),
                ),
              ),
              onPressed: () {
                getDate(dosage);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => NavigatorBar(),
                  ),
                );
              },
              child: Text(
                '저장', style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
