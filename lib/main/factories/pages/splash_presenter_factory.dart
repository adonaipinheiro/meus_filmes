import 'package:meus_filmes/main/factories/usecases/splash/remote_check_user.dart';
import 'package:meus_filmes/presentation/splash/splash_presenter.dart';

SplashPresenter makeSplashPresenter() => SplashPresenter(
      checkUser: makeRemoteCheckUser(),
    );
