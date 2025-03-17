import 'package:flutter_test_avilatek/core/network/api_client.dart';
import 'package:flutter_test_avilatek/data/models/actor.dart';
import 'package:flutter_test_avilatek/data/models/movie.dart';

class MovieRepository {
  final ApiClient _apiClient;

  MovieRepository(this._apiClient);

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      final response = await _apiClient.get('/movie/popular');
      print('API Response: ${response.data}'); // 🔍 PRINT RAW DATA
      final List results = response.data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      throw Exception("Failed to fetch movies: $e");
    }
  }

  Future<List<Actor>> fetchMovieActors(int movieID) async {
    final response = await _apiClient.get("/movie/$movieID/credits");
    final List<dynamic> cast = response.data['cast'];
    final mappedCast =
        cast.take(3).map((json) => Actor.fromJson(json)).toList();

    return mappedCast;
  }

  Future<Actor> fetchActorDetails(int actorID) async {
    final response = await _apiClient.get(
      "/person/$actorID",
      params: {"append_to_response": "movie_credits"},
    );
    final actor = Actor.fromJson(response.data).copyWith(
      knownFor: List<Map<String, dynamic>>.from(
        response.data["movie_credits"]?["cast"] ?? [],
      ),
    );

    return actor;
  }
}
