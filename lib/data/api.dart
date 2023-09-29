import 'dart:convert';

import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabatApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '39735462-7b5946eb6bf26485274c64c9b';

  Future<List<Photo>> fetch(String query) async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
