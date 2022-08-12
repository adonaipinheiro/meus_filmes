import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/presentation/signup/signup_presenter.dart';
import 'package:meus_filmes/ui/widgets/separator_widget.dart';
import 'package:meus_filmes/ui/widgets/text_input_custom.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final presenter = Get.find<SignUpPresenter>();

  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _repPassController;
  late TextEditingController _passController;
  bool checkPass = true;

  void _checkPassFunc() {
    if (_passController.text != _repPassController.text) {
      setState(() {
        checkPass = false;
      });
    } else {
      setState(() {
        checkPass = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _repPassController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _repPassController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    presenter.showLoginFailed.listen((show) {
      if (show) {
        presenter.showLoginFailed.value = false;
        Get.snackbar(
          'Atenção',
          'Dados incompletos',
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
                      controller: _nameController, hintText: 'Nome completo'),
                  const Separator(),
                  TextInputCustom(
                      controller: _emailController, hintText: 'E-mail'),
                  const Separator(),
                  TextField(
                    controller: _passController,
                    obscureText: true,
                    onChanged: (_) {
                      _checkPassFunc();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                    ),
                  ),
                  const Separator(),
                  TextField(
                    controller: _repPassController,
                    obscureText: true,
                    onChanged: (_) {
                      _checkPassFunc();
                    },
                    decoration: InputDecoration(
                      errorText:
                          checkPass ? null : 'As senhas não estão iguais',
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      hintText: 'Repita a Senha',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                    ),
                  ),
                  const Separator(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: const Color(0xff8c59a4),
                      primary: Colors.white,
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      presenter.onRegisterWithEmail(_emailController.text,
                          _passController.text, _nameController.text);
                    },
                    child: const Text('Cadastrar'),
                  ),
                  const Separator(),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color(0xff8c59a4),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      presenter.goToLogin();
                    },
                    child: const Text('Já possui conta? Entrar'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
