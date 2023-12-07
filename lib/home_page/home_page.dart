import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/character_page/character_page.dart';
import 'package:untitled/marvel/marvel_character_model.dart';
import 'package:untitled/marvel/marvel_list_characters_model.dart';
import 'package:untitled/marvel/marvel_services.dart';
import 'package:untitled/widgets.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MarvelApiService marvelApiService = MarvelApiService();
  MarvelCharactersList characters = MarvelCharactersList();
  MarvelCharacterModel character = MarvelCharacterModel();
  int offset = 0;
  bool isLoading = false;
  String totalCharacters = '0';
  final FocusNode _focusNode = FocusNode();
  String? nameCharacter;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final DismissDirection _dismissDirection = DismissDirection.horizontal;

  @override
  void initState() {
    fetchMarvelCharacter(null);
    super.initState();
  }

  Future<void> fetchMarvelCharacter(String? offset) async {
    setState(() {
      isLoading = true;
    });
    var res = await marvelApiService.getCharacters(offset);
    if (res != null) {
      characters = MarvelCharactersList.fromJson(res);
      totalCharacters = characters.data!.total.toString();
      isLoading = false;
      setState(() {});
    } else {
      debugPrint('La respuesta es nula');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      backgroundColor: marvelRedColor,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
        height: size.height * 0.09,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset(
                leftChevron,
                color: Colors.white,
              ),
              onTap: () async {
                await moveLeft();
              },
            ),
            const Spacer(),
            Text(
              '$offset / $totalCharacters',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: bottomFont,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              child: Image.asset(
                rightChevron,
                color: Colors.white,
              ),
              onTap: () async {
                await moveRight();
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: generalHorizontalPadding,
            right: generalHorizontalPadding,
            top: 15,
            height: size.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextField(
                    focusNode: _focusNode,
                    controller: textEditingController,
                    style: const TextStyle(
                        fontSize: generalFontSize, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Buscar Superhéroe o Villano',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (name) async {
                      await searchByName(textEditingController);
                    },
                  ),
                ),
                CustomBackButton(
                  iconData: Icons.close,
                  onTap: () {
                    textEditingController.text = '';
                    fetchMarvelCharacter(null);
                  },
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3,
                    blurRadius: 25,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            margin: EdgeInsets.fromLTRB(generalHorizontalPadding,
                size.height * 0.15, generalHorizontalPadding, 10),
            child: !isLoading
                ? GestureDetector(
                    onHorizontalDragEnd: (details) async {
                      if (details.primaryVelocity! > 0) {
                        await moveLeft();
                      } else {
                        await moveRight(); // Deslizamiento hacia la izquierda
                      }
                    },
                    child: ListView.builder(
                        key: listKey,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MarvelCharacterCard(
                              character: characters.data!.results![index]);
                        },
                        itemCount: characters.data?.count ?? 0),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  Future<void> moveRight() async {
    if (offset + 20 < int.parse(totalCharacters)) {
      offset += 20;

      String param = '&offset=$offset';
      if (nameCharacter != null) {
        param += '&nameStartsWith=$nameCharacter';
      }
      await getCharactersWithParam(param);
      setState(() {});
    }
  }

  Future<void> moveLeft() async {
    offset -= 20;
    if (offset < 0) {
      offset = 0;
    } else {
      String param = '&offset=$offset';
      if (nameCharacter != null) {
        param += '&nameStartsWith=$nameCharacter';
      }
      await getCharactersWithParam(param);
    }
    setState(() {});
  }

  Future<void> searchByName(TextEditingController textEditingController) async {
    _focusNode.unfocus();
    nameCharacter = textEditingController.text;
    await getCharactersWithParam(
        '&nameStartsWith=${textEditingController.text}');
    setState(() {
      totalCharacters = characters.data!.total.toString();
      offset = 0;
    });
  }

  Future<void> getCharactersWithParam(String param) async {
    try {
      setState(() {
        isLoading = true;
      });

      var res = await marvelApiService.getCharacters(param);
      if (res != null) {
        characters = MarvelCharactersList.fromJson(res);
      } else {
        debugPrint('La respuesta es nula');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      throw Exception('Error al cargar los personajes: $e');
    }
  }
}

class MarvelCharacterCard extends StatelessWidget {
  const MarvelCharacterCard({
    super.key,
    required this.character,
  });

  final Results character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        MarvelApiService marvelApiService = MarvelApiService();
        var res =
            await marvelApiService.getCharactersById(character.id.toString());

        if (res != null) {
          var character = MarvelCharacterModel.fromJson(res);
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: CharacterPage(
                    characterInfo: character,
                  ),
                  childCurrent: this));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orangeAccent, // Color del borde
                    width: 2.0, // Ancho del borde
                  ),
                ),
                child: ClipOval(
                  child: Hero(
                    tag: character.id!,
                    child: Image.network(
                      '${character.thumbnail!.path!}.jpg',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Container(
                          width: 50,
                          height: 50,
                          color: marvelRedColor,
                          child: const Icon(
                            Icons.error,
                            size: 40,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                character.name!,
                style: const TextStyle(
                    fontSize: generalFontSize,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'CaptainMarvel'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
