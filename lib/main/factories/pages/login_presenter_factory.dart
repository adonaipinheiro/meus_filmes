import 'package:meus_filmes/main/factories/usecases/login/remote_login_with_password_factory.dart';
import 'package:meus_filmes/presentation/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() => LoginPresenter(
      loginWithEmail: makeRemoteLoginWithEmail(),
    );
