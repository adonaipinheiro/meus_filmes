import 'package:meus_filmes/domain/entities/movie_entity.dart';

class MovieModel {
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
  });

  int id;
  String title;
  String overview;
  num voteAverage;
  String backdropPath;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
    );
  }

  MovieEntity toEntity() => MovieEntity(
        id: id,
        title: title,
        overview: overview,
        voteAverage: voteAverage.toString(),
        backdropPath: backdropPath,
      );
}
