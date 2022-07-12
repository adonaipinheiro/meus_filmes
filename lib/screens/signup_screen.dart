import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _repPassController;
  late TextEditingController _passController;
  bool checkPass = true;

  void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void checkPassFunc() {
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

  Future<void> createUserWithEmailAndPass(BuildContext context) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      UserCredential userInfo = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passController.text);

      users.add({
        'full_name': _nameController.text,
        'email': _emailController.text,
        'uuid': userInfo.user?.uid
      });

      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha muito fraca'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail já cadastrado'),
          ),
        );
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Algo deu errado'),
        ),
      );
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Nome completo',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
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
                    onChanged: (_) {
                      checkPassFunc();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff8c59a4))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _repPassController,
                    obscureText: true,
                    onChanged: (_) {
                      checkPassFunc();
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
                      createUserWithEmailAndPass(context);
                    },
                    child: const Text('Cadastrar'),
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
                      goToSignUp(context);
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
