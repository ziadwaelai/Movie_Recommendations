import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'layout/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              title: 'Movie',
              home: HomeScreen(),
            ));
  }
}
