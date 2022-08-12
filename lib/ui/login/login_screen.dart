import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/presentation/login/login_presenter.dart';
import 'package:meus_filmes/screens/signup_screen.dart';
import 'package:meus_filmes/ui/home/home_screen.dart';
import 'package:meus_filmes/widgets/separator_widget.dart';
import 'package:meus_filmes/widgets/text_input_custom.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;

  void goToSignUp() {
    Navigator.pushNamed(context, SignUpScreen.id);
  }

  void signInWithEmailAndPass() async {
    try {
      UserCredential _ = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passController.text.toString());
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário ou senha incorretos'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Algo deu errado'),
          ),
        );
      }
    }
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
    final presenter = Get.find<LoginPresenter>();

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
                    'lib/images/logo.png',
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
                    onPressed: () {
                      signInWithEmailAndPass();
                    },
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
                      goToSignUp();
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
