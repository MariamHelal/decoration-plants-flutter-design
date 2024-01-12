import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/home_page.dart';

void main() {
  runApp(const DecorationPlanetApp());
}


class DecorationPlanetApp extends StatelessWidget {
  const DecorationPlanetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    },

    );
  }
}

