
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splashImgs = ['Nkati3.jpg'];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView.builder(
          itemCount: splashImgs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/imgs/${splashImgs[index]}",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.h, top: 80.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      "Find the RIGHT wallpapper for the RIGHT mood",
                      style: TextStyle(
                        fontSize: 26.sp,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () => Get.to(() => const HomePage()),
                    child: Container(
                      width: double.maxFinite,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                            color: Colors.white70,
                            width: 1.w,
                            style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(
                          "LETS BEGIN",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white70,
                              letterSpacing: 5.w),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
