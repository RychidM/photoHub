
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class LargeImage extends StatefulWidget {
  const LargeImage({Key? key}) : super(key: key);

  @override
  State<LargeImage> createState() => _LargeImageState();
}

class _LargeImageState extends State<LargeImage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save your Wallpaper"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              Get.arguments['src'],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w, bottom: 10.h),
              child: Container(
                width: double.maxFinite,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                      color: Colors.white,
                      width: 1.w,
                      style: BorderStyle.solid),
                ),
                child: Center(
                  child: InkWell(
                    onTap: setWallpaper,
                    child: Text(
                      "Download full image",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white70,
                          letterSpacing: 5.w),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  setWallpaper() async {
    // await _askPermission();
    var response = await Dio().get(Get.arguments['src'],
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //             .requestPermissions([PermissionGroup.photos]);
  //   } else {
  //    PermissionStatus permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }
}

