import 'package:meus_filmes/data/usecases/home/remote_fetch_popular_movies.dart';
import 'package:meus_filmes/main/factories/infra/http_client_factory.dart';

RemoteFetchPopularMovies makeRemoteFetchPopularMovies() =>
    RemoteFetchPopularMovies(
      httpClient: makeHttpClient(),
    );
