import 'package:meus_filmes/data/http/http_client.dart';
import 'package:meus_filmes/data/usecases/models/movie_model.dart';
import 'package:meus_filmes/domain/entities/movie_entity.dart';
import 'package:meus_filmes/domain/usecases/home/fetch_popular_movies.dart';

class RemoteFetchPopularMovies extends FetchPopularMovies {
  RemoteFetchPopularMovies({
    required this.httpClient,
  });

  HttpClient httpClient;

  @override
  Future<List<MovieEntity>> execute() async {
    final response = await httpClient.get(
        url:
            'https://api.themoviedb.org/3/movie/popular?api_key=75cb9e2e5676e68210ce339dc9ffb5fe&language=pt-BR&page=1');

    return response['results']
        .map<MovieEntity>(
            (movieJson) => MovieModel.fromJson(movieJson).toEntity())
        .toList();
  }
}
