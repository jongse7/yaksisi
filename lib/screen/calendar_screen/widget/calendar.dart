// 캘린더 위젯

import 'package:intl/intl.dart';
import 'package:yaksisi/screen/calendar_screen/model/marker_model.dart';
import '../../../const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;

  const Calendar({
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final defaultBoxDeco = BoxDecoration(
      color: Colors.black,
      border: Border.symmetric(
        horizontal:
            BorderSide(color: const Color(0xff444444), width: width * 0.002),
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: width * 0.045,
    );
    return SingleChildScrollView(
      child: TableCalendar(
        eventLoader: getEventsForDay,
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            switch (day.weekday) {
              case 1:
                return Center(
                  child: Text(
                    '월',
                    style: defaultTextStyle,
                  ),
                );
              case 2:
                return Center(
                  child: Text(
                    '화',
                    style: defaultTextStyle,
                  ),
                );
              case 3:
                return Center(
                  child: Text(
                    '수',
                    style: defaultTextStyle,
                  ),
                );
              case 4:
                return Center(
                  child: Text(
                    '목',
                    style: defaultTextStyle,
                  ),
                );
              case 5:
                return Center(
                  child: Text(
                    '금',
                    style: defaultTextStyle,
                  ),
                );
              case 6:
                return Center(
                  child: Text(
                    '토',
                    style: defaultTextStyle.copyWith(color: Colors.blue),
                  ),
                );
              case 7:
                return Center(
                  child: Text(
                    '일',
                    style: defaultTextStyle.copyWith(color: Colors.red),
                  ),
                );
            }
          },
          markerBuilder: (context, date, events) {
            if (events.isEmpty) return SizedBox();
            if (){},
            return Column(
              children: [
                SizedBox(
                  height: height * 0.035,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height * 0.01),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.03,
                              height: height * 0.02,
                              decoration: BoxDecoration(
                                color: Color(0xffED638C),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(width * 0.005),
                                  bottomLeft: Radius.circular(width * 0.005),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.11,
                              height: height * 0.02,
                              decoration: BoxDecoration(
                                color: Color(0xffF1C0CC),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width * 0.005),
                                  bottomRight: Radius.circular(width * 0.005),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            );
          },
        ),
        daysOfWeekHeight: height * 0.06,
        rowHeight: height * 0.125,
        locale: "ko_KR",
        focusedDay: focusedDay,
        firstDay: DateTime(1800),
        lastDay: DateTime(3000),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width * 0.08,
            color: Colors.white,
          ),
        ),
        calendarStyle: CalendarStyle(
          markersAlignment: Alignment.topCenter,
          cellAlignment: Alignment.topCenter,
          cellMargin: const EdgeInsets.all(0),
          isTodayHighlighted: false,
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: defaultBoxDeco.copyWith(
              color: Colors.white,
              border: Border.all(
                color: PRIMARY_COLOR,
              )),
          outsideDecoration: defaultBoxDeco.copyWith(
            border: Border.symmetric(
              horizontal: BorderSide(
                  color: const Color(0xff444444), width: width * 0.002),
            ),
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(
            color: PRIMARY_COLOR,
          ),
          outsideTextStyle: defaultTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        onDaySelected: onDaySelected,
        selectedDayPredicate: (DateTime dateTime) {
          if (selectedDay == null) {
            return false;
          }
          return dateTime.year == selectedDay!.year &&
              dateTime.month == selectedDay!.month &&
              dateTime.day == selectedDay!.day;
        },
      ),
    );
  }
}
