// 하단 네비게이터 바

import 'package:flutter/material.dart';
import 'package:yaksisi/screen/calendar_screen.dart';
import 'package:yaksisi/screen/camera_screen.dart';
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
        body: TabBarView(
          children: [
            CalendarScreen(), // 달력 페이지
            CameraScreen(), // 카메라 페이지
            PillListScreen(), // 투약 목록 페이지
          ],
        ),
        extendBodyBehindAppBar: true, // add this line
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.black,
            )
          ),
          child: Container(
            height: height * 0.15,
            child: TabBar(
              //tab 하단 indicator size -> .label = label의 길이
              //tab 하단 indicator size -> .tab = tab의 길이
              indicatorSize: TabBarIndicatorSize.label,
              //tab 하단 indicator color
              indicatorColor: Colors.green,
              //tab 하단 indicator weight
              indicatorWeight: 2,
              //label color
              labelColor: Colors.green,
              //unselected label color
              unselectedLabelColor: Colors.green,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    size: width * 0.1,
                  ),
                ),
                Tab(
                  icon: Stack(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: width * 0.125,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle_outlined,
                          size: width * 0.075,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.event_note_outlined,
                    size: width * 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
