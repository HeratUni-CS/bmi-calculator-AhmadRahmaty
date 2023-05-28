import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator
    extends StatelessWidget {
  const BMICalculator({Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0D22)),
          scaffoldBackgroundColor:
              Color(0xFF0A0D22),
         ),
      home: inputPage(),
    );
  }
}

