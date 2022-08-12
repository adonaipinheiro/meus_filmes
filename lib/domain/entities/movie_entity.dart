class MovieEntity {
  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
  });

  int id;
  String title;
  String overview;
  String voteAverage;
  String backdropPath;
}
