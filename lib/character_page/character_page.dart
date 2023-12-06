import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/marvel/marvel_character_model.dart';
import 'package:untitled/marvel/marvel_series_model.dart';
import 'package:untitled/marvel/marvel_services.dart';
import 'package:untitled/series_page/series_page.dart';
import 'package:untitled/widgets.dart';
import '../comics_page/comics_page.dart';
import '../marvel/marvel_comic_model.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key, required this.characterInfo});

  final MarvelCharacterModel characterInfo;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var character = characterInfo.data!.resultsData?[0];
    MarvelApiService marvelApiService = MarvelApiService();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: character!.id!,
                  child: Image.network(
                    '${character.thumbnail!.path}.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Container(
                        height: size.height * 0.5,
                        color: marvelRedColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error al cargar la imagen',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'CaptainMarvel'),
                            ),
                            SizedBox(height: 15),
                            Icon(
                              Icons.error,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: CustomBackButton(onTap: () {
                    Navigator.pop(context);
                  }),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name!,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'CaptainMarvel'),
                  ),
                  const SizedBox(height: 5),
                  Text(
                      character.description != ""
                          ? character.description!
                          : 'N/A',
                      style: const TextStyle(
                        fontSize: 18,
                        //fontFamily: 'CaptainMarvel'),
                      )),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedButton(
                          label: 'Comics',
                          onPressed: () async {
                            var res =
                                await marvelApiService.getComicsByCharacterId(
                                    character.id.toString());
                            if (res != null) {
                              var comics = MarvelComics.fromJson(res);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTopPop,
                                      child: ComicsPage(
                                        comics: comics.data!,
                                      ),
                                      childCurrent: this));
                            }
                          }),
                      SizedBox(width: 15.sp),
                      RoundedButton(
                          label: 'Series',
                          onPressed: () async {
                            var res =
                                await marvelApiService.getSeriesByCharacterId(
                                    character.id.toString());
                            if (res != null) {
                              var series = MarvelSeries.fromJson(res);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTopPop,
                                      child: SeriesPage(
                                        series: series.data!,
                                      ),
                                      childCurrent: this));
                            }
                          }),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 24,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'CaptainMarvel'),
      ),
    );
  }
}
