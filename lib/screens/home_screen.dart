import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meus_filmes/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:meus_filmes/screens/splash_screen.dart';
import 'package:meus_filmes/widgets/movie_item_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> movies;

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, SplashScreen.id);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Algo deu errado'),
        ),
      );
    }
  }

  Future<List<Movie>> _fetchMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=75cb9e2e5676e68210ce339dc9ffb5fe&language=pt-BR&page=1'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      List<Movie> movies =
          data.map((tagJson) => Movie.fromJson(tagJson)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Movies');
    }
  }

  @override
  void initState() {
    super.initState();
    movies = _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff8c59a4),
          title: Text(
            "Melhores Filmes",
            style: GoogleFonts.dancingScript(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  _signOut(context);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            )
          ],
        ),
        body: FutureBuilder<List<Movie>>(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return MovieItemWidget(
                    movie: snapshot.data![index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text("Erro ao buscar informações"));
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8c59a4),
              ),
            );
          },
        ));
  }
}
