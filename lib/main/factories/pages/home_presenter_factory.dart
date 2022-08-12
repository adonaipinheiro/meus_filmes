import 'package:meus_filmes/main/factories/usecases/home/remote_fetch_popular_movies_factory.dart';
import 'package:meus_filmes/main/factories/usecases/home/remote_sign_out.dart';
import 'package:meus_filmes/presentation/home/home_presenter.dart';

HomePresenter makeHomePresenter() => HomePresenter(
      fetchPopularMovies: makeRemoteFetchPopularMovies(),
      signOut: makeRemoteSignOut(),
    );
