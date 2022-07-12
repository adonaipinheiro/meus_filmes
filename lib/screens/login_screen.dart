import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;

  void goToSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  void signInWithEmailAndPass() async {
    try {
      UserCredential _ = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passController.text.toString());
      Navigator.pushReplacementNamed(context, '/home');
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
                    "Meus Filmes",
                    style: GoogleFonts.dancingScript(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff8c59a4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                    ),
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
