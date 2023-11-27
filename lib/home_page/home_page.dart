import 'package:flutter/material.dart';
import 'package:untitled/marvel/marvel_character_model.dart';
import 'package:untitled/marvel/marvel_services.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MarvelApiService marvelApiService = MarvelApiService();
  MarvelCharacter characters = MarvelCharacter();
  int offset = 0;
  bool isLoading = false;
  String totalCharacters = '0';

  @override
  void initState() {
    fetchMarvelCharacter(null);
    super.initState();
  }

  Future<void> fetchMarvelCharacter(String? offset) async {
    var res = await marvelApiService.getCharacters(offset);
    if (res != null) {
      characters = MarvelCharacter.fromJson(res);
      totalCharacters = characters.data!.total.toString();
      setState(() {});
    } else {
      print('La respuesta es nula');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                try {
                  setState(() {
                    isLoading = true;
                  });
                  offset -= 20;
                  Map<String, dynamic> res;
                  if (offset < 0) {
                    offset = 0;
                    res = await marvelApiService.getCharacters(null);
                  } else {
                    res =
                        await marvelApiService.getCharacters(offset.toString());
                  }
                  if (res != null) {
                    characters = MarvelCharacter.fromJson(res);
                  } else {
                    debugPrint('La respuesta es nula');
                  }
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  debugPrint('Error al cargar los personajes: $e');
                  throw Exception('Failed to load characters');
                }
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
                try {
                  setState(() {
                    isLoading = true;
                  });
                  offset += 20;
                  var res =
                      await marvelApiService.getCharacters(offset.toString());
                  if (res != null) {
                    characters = MarvelCharacter.fromJson(res);
                  } else {
                    debugPrint('La respuesta es nula');
                  }
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  debugPrint('Error al cargar los personajes: $e');
                  throw Exception('Failed to load characters');
                }
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
            top: -30,
            height: size.width * 0.35,
            child: Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(0, 30, size.width * 0.2, 0),
                    child: TextField(
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
                    ),
                  ),
                  Image.asset(
                    searchIcon,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
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
                ? ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MarvelCharacterCard(
                        characterName: characters.data!.results![index].name!,
                        urlImage:
                            '${characters.data!.results![index].thumbnail!.path}',
                      );
                    },
                    itemCount: characters.data?.count ?? 0)
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

class MarvelCharacterCard extends StatelessWidget {
  const MarvelCharacterCard({
    super.key,
    required this.characterName,
    required this.urlImage,
  });

  final String characterName;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Image.network(
                  '$urlImage.jpg',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    // Este constructor de widgets se ejecutará en caso de error
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
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              characterName,
              style: const TextStyle(
                  fontSize: generalFontSize,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'CaptainMarvel'),
            ),
          )
        ],
      ),
    );
  }
}
