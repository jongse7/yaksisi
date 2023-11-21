// 하단 네비게이터 바

import 'package:flutter/material.dart';
import 'package:yaksisi/coponent/camera_pop_up.dart';
import 'package:yaksisi/screen/calendar_screen.dart';
import 'package:yaksisi/screen/empty_screen.dart';
import 'package:yaksisi/screen/pill_list_screen.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3, // 페이지 개수
      child: Scaffold(
        // 캘린더와 바텀바 사이에 아주 얇게 배경색이 보여서 검정색으로 설정
        backgroundColor: Colors.black,
        body: TabBarView(
          children: [
            CalendarScreen(), // 달력 페이지
            EmptyScreen(),
            PillListScreen(), // 투약 목록 페이지
          ],
        ),
        extendBodyBehindAppBar: true, // add this line
        bottomNavigationBar: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: BottomIcons(),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: IconButton(
                padding: EdgeInsets.only(top: height * 0.01),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => CameraPopUp(),
                  );
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: width * 0.15,
                  color: Color(0xff11CE24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomIcons extends StatelessWidget {
  const BottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.15,
      child: TabBar(
        //tab 하단 indicator size -> .label = label의 길이
        //tab 하단 indicator size -> .tab = tab의 길이
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Color(0xff11CE24),
            width: width * 0.018,
          ),
          borderRadius: BorderRadius.circular(width * 0.1),
          insets: EdgeInsets.symmetric(horizontal: -width * 0.03),
        ),
        indicatorPadding: EdgeInsets.only(bottom: height * 0.016),
        //label color
        labelColor: Color(0xff11CE24),
        //unselected label color
        unselectedLabelColor: Color(0xff11CE24),
        tabs: [
          Tab(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: width * 0.15,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.black,
              size: width * 0.125,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.event_note_outlined,
              size: width * 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
