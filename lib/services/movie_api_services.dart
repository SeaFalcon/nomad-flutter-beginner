import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode_detail.dart';

/*
https://movies-api.nomadcoders.workers.dev/popular
https://movies-api.nomadcoders.workers.dev/now-playing
https://movies-api.nomadcoders.workers.dev/coming-soon
https://movies-api.nomadcoders.workers.dev/movie?id=939243
https://image.tmdb.org/t/p/w500/ + 이미지 경로 > https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg
*/

final filter = ['popular', 'now-playing', 'coming-soon'];

class MovieApiServices {
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  // static const String popular = 'popular';
  // static const String nowPlaying = 'now-playing';
  // static const String comingSoon = 'coming-soon';

  static Future<List<MovieModel>> getMoviesByFilter(int type) async {
    List<MovieModel> movieInstances = [];

    final url = Uri.parse('$baseUrl/${filter[type]}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic movies = jsonDecode(response.body);
      for (var movie in movies['results']) {
        final movieInstance = MovieModel.fromJson(movie);
        movieInstances.add(movieInstance);
      }

      return movieInstances;
    } else {
      throw Error();
    }
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
