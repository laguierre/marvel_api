import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/marvel/marvel_series_model.dart';
import 'package:untitled/widgets.dart';

import '../constants.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key, required this.stories});

  final Data stories;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 30,
                left: generalHorizontalPadding,
                right: 2 * generalHorizontalPadding),
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: marvelRedColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 3,
                  blurRadius: 25,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child:  Row(
              children: [
                CustomBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                const Text('Series',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'CaptainMarvel'))
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 20, 15, 0),
              itemCount: stories.results!.length,
              itemBuilder: (context, index) {
                String text = 'N/A';
                String price = 'N/A';

                if (stories.results![index].description != null) {
                  text = stories.results![index].description!;
                }
                if (stories.results![index].startYear != null) {
                  price = stories.results![index].startYear.toString();
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5.sp, 0, 15.sp, 0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10.sp),
                      height: 100.sp,
                      width: 100.sp,
                      child: Column(
                        children: [
                          Image.network(
                              '${stories.results![index].thumbnail!.path}.jpg',
                              fit: BoxFit.contain),
                          SizedBox(height: 5.sp),
                          Expanded(
                              child: Text(
                            'Year: $price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stories.results![index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        SizedBox(height: 5.sp),
                        Text(
                          text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 10.sp),
                        )
                      ],
                    ))
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 1,
                  color: Colors.grey,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
