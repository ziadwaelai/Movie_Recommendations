import 'package:flutter/material.dart';
import 'package:movie/components/api.dart';
import 'package:sizer/sizer.dart';
import 'components/components.dart';
import 'layout/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => const MaterialApp(
              title: 'Movie',
              home: HomeScreen(),
            ));
  }
}
