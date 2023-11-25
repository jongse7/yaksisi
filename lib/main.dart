import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'coponent/navigator_bar.dart';

// 6~8번 코드로 달력에 한글 적용 가능
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: NavigatorBar(),
    ),
  );
}
