import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List photos = [];
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  fetchImages() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=50'),
        headers: {
          'Authorization':
              '563492ad6f917000010000013148a89a00e74c7a9884c25e7ff24cfc'
        }).then((value) {
      Map response = jsonDecode(value.body);
      setState(() {
        photos = response['photos'];
      });
    });
  }

  loadMorePhotos() async {
    setState(() {
      pageNumber += 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=50&page=$pageNumber';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f917000010000013148a89a00e74c7a9884c25e7ff24cfc'
    }).then((value) {
      Map res = jsonDecode(value.body);
      setState(() {
        photos.addAll(res['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.abc_rounded),
          title: const Text("Home"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: StaggeredGridView.countBuilder(
                      itemCount: photos.length,
                      crossAxisCount: 3,
                      mainAxisSpacing: 1.5.h,
                      crossAxisSpacing: 1.5.w,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed("/fullscreen/", arguments: {
                            'src': photos[index]['src']['large2x'].toString(),
                          }),
                          child: Container(
                            height: 180.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Image.network(
                              photos[index]['src']['tiny'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1))),
              SizedBox(
                height: 45.h,
                child: Center(
                  child: InkWell(
                    onTap: loadMorePhotos,
                    child: Text(
                      "Give me more",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
