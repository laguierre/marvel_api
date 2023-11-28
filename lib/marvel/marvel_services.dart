import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'credentials.dart';

class MarvelApiService {
  String _generateHash(String timestamp) {
    var bytes = utf8.encode('$timestamp$privateKey$publicKey');
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  // Future<Map<String, dynamic>> getCharacters() async {
  //   final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  //   final hash = _generateHash(timestamp);
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/characters'),
  //     headers: {
  //       'ts': timestamp,
  //       'apikey': publicKey,
  //       'hash': hash,
  //     },
  //   );
  //
  //   print('URL: ${Uri.parse('$baseUrl/characters?ts=$timestamp&apikey=$publicKey&hash=$hash')}');
  //
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     return data;
  //   } else {
  //     throw Exception('Failed to load characters');
  //   }
  // }
  Future<Map<String, dynamic>> getCharacters(String? param) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);

      String url = '$baseUrl/characters?ts=$timestamp&apikey=$publicKey&hash=$hash';

      if (param != null) {
        url += param;
      }
      final Uri uri = Uri.parse(url);
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
            await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load characters. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load characters');
    } finally {
      httpClient.close();
    }
  }

  Future<Map<String, dynamic>> getCharactersByName(String name) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);
      final Uri uri = Uri.parse(
          '$baseUrl//characters?nameStartsWith=$name&ts=$timestamp&apikey=$publicKey&hash=$hash');
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
            await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load characters. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar los personajes: $e');
      throw Exception('Failed to load characters');
    } finally {
      httpClient.close();
    }
  }
}
