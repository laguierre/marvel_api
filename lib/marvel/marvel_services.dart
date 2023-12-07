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

  Future<Map<String, dynamic>> getCharactersById(String id) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);
      final Uri uri = Uri.parse(
          '$baseUrl/characters/$id?ts=$timestamp&apikey=$publicKey&hash=$hash');
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
            await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load character. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar el personaje: $e');
    } finally {
      httpClient.close();
    }
  }
  Future<Map<String, dynamic>> getComicsByCharacterId(String id) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);
      final Uri uri = Uri.parse(
          '$baseUrl/characters/$id/comics?ts=$timestamp&apikey=$publicKey&hash=$hash');
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
        await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load comics. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar el comics del personaje: $e');
    } finally {
      httpClient.close();
    }
  }
  Future<Map<String, dynamic>> getSeriesByCharacterId(String id) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);
      final Uri uri = Uri.parse(
          '$baseUrl/characters/$id/series?ts=$timestamp&apikey=$publicKey&hash=$hash');
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
        await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load comics. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar el comics del personaje: $e');
    } finally {
      httpClient.close();
    }
  }
  Future<Map<String, dynamic>> getStoriesByCharacterId(String id) async {
    final HttpClient httpClient = HttpClient();

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = _generateHash(timestamp);
      final Uri uri = Uri.parse(
          '$baseUrl/characters/$id/stories?ts=$timestamp&apikey=$publicKey&hash=$hash');
      final HttpClientRequest request = await httpClient.getUrl(uri);
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final String responseBody =
        await response.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'Failed to load stories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar el comics del stories: $e');
    } finally {
      httpClient.close();
    }
  }

}
