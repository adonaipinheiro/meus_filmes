import 'package:meus_filmes/domain/entities/movie_entity.dart';

abstract class FetchPopularMovies {
  Future<List<MovieEntity>> execute();
}
