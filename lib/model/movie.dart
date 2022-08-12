class Movie {
  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
    );
  }
}
