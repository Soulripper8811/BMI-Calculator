import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        scaffoldBackgroundColor: Color.fromARGB(255, 4, 6, 14),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: Colors.green,
        // ),
      ),
      home: InputPage(),
    );
  }
}
