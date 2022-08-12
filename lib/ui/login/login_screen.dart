import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/presentation/login/login_presenter.dart';
import 'package:meus_filmes/ui/widgets/separator_widget.dart';
import 'package:meus_filmes/ui/widgets/text_input_custom.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final presenter = Get.find<LoginPresenter>();
  late TextEditingController _emailController;
  late TextEditingController _passController;

  void _signInWithEmailAndPass() {
    presenter.onLoginWithEmail(
        _emailController.text.toString(), _passController.text.toString());
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    presenter.showLoginFailed.listen((show) {
      if (show) {
        presenter.showLoginFailed.value = false;
        Get.snackbar(
          'Atenção',
          'Usuário ou senha incorretos',
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING,
        );
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 40,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/ui/images/logo.png',
                    width: 150,
                  ),
                  Text(
                    "Melhores Filmes",
                    style: GoogleFonts.dancingScript(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff8c59a4),
                    ),
                  ),
                  const Separator(),
                  TextInputCustom(
                    controller: _emailController,
                    hintText: 'E-mail',
                  ),
                  const Separator(),
                  TextInputCustom(
                    controller: _passController,
                    hintText: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: const Color(0xff8c59a4),
                      primary: Colors.white,
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: _signInWithEmailAndPass,
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xff8c59a4),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      presenter.goToSignUp();
                    },
                    child: const Text('Não possui conta? Cadastre-se'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
