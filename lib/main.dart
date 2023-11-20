import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'coponent/navigator_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'NotoSans',
        ),
        home: NavigatorBar(),
      ));
}
