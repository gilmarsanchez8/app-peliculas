import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_app_movies/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = '66e9cbb466258644b57dc1c883b873fd';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}