import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/widgets.dart';

import '../constants.dart';
import '../marvel/marvel_comic_model.dart';

class ComicsPage extends StatelessWidget {
  const ComicsPage({super.key, required this.comics});

  final Data comics;

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
                CustomBackButton(onTap: () { Navigator.pop(context);  },),
                const Spacer(),
                const Text('Comics',
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
              padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
              itemCount: comics.results!.length,
              itemBuilder: (context, index) {
                RegExp exp = RegExp(r'<[^>]*>');
                String text = 'N/A';
                String price = 'N/A';
                if (comics.results![index].textObjects!.isNotEmpty) {
                  text = comics.results![index].textObjects!.first.text!
                      .replaceAll(exp, '');
                }
                if (comics.results![index].prices!.first.price != null) {
                  price = comics.results![index].prices!.first.price.toString();
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 150.sp,
                      width: 90.sp,
                      child: Column(
                        children: [
                          Image.network(
                              '${comics.results![index].thumbnail!.path}.jpg',
                              fit: BoxFit.contain),
                          SizedBox(height: 5.sp),
                          Expanded(
                              child: Text(
                            '\$$price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comics.results![index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        SizedBox(height: 5.sp),
                        Text(
                          text,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
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
