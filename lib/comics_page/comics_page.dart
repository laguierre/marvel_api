import 'package:flutter/material.dart';
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
            child: const Row(
              children: [
                CustomBackButton(),
                Spacer(),
                Text('Comics',
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
                //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                itemCount: comics.results!.length!,
                itemBuilder: (context, index) {
                  RegExp exp = RegExp(r'<[^>]*>');
                  String text;
                  if(comics.results![index].textObjects!.isNotEmpty) {
                     text = comics.results![index].textObjects!.first!
                        .text!.replaceAll(exp, '');
                  }
                  else{
                    text = 'N/A';
                  }
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 150,
                        width: 100,
                        child: Image.network(
                            '${comics.results![index].thumbnail!.path}.jpg',
                            fit: BoxFit.contain),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comics.results![index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(text)
                        ],
                      ))
                    ],
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
            },),
          )
        ],
      ),
    );
  }
}
