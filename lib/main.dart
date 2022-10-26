import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photography_hub/pages/full_image.dart';
import 'package:photography_hub/pages/home_page.dart';

import 'pages/splah_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: ()=> const HomePage()),
          GetPage(name: "/fullscreen", page: ()=> const LargeImage())
        ],
        home: const SplashScreen(),
      ),
    );
  }
}
