import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:meus_filmes/presentation/home/home_presenter.dart';
import 'package:meus_filmes/ui/widgets/movie_item_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();

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
                presenter.onSignOut();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: Obx(
        () {
          final moviesList = presenter.moviesList.value;
          return ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return MovieItemWidget(
                movie: moviesList[index],
              );
            },
          );
        },
      ),
    );
  }
}
