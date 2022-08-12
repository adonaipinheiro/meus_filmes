import 'package:get/get.dart';
import 'package:meus_filmes/domain/entities/movie_entity.dart';
import 'package:meus_filmes/domain/usecases/home/fetch_popular_movies.dart';
import 'package:meus_filmes/domain/usecases/home/sign_out.dart';
import 'package:meus_filmes/ui/splash/splash_screen.dart';

class HomePresenter extends GetxController {
  HomePresenter({
    required this.fetchPopularMovies,
    required this.signOut,
  });

  FetchPopularMovies fetchPopularMovies;
  SignOut signOut;

  RxList<MovieEntity> moviesList = RxList<MovieEntity>([]);

  void onSignOut() async {
    await signOut.execute();
    Get.offAndToNamed(SplashScreen.id);
  }

  @override
  void onInit() async {
    super.onInit();
    final list = await fetchPopularMovies.execute();
    moviesList.value = list;
  }
}
