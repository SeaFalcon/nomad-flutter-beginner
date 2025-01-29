import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_services.dart';
import 'package:toonflix/widgets/components/movie_detail.dart';

class PopularMovie extends StatelessWidget {
  final MovieModel popularMovie;

  const PopularMovie({
    super.key,
    required this.popularMovie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(movieDetail: popularMovie),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          '${MovieApiServices.imageBaseUrl}${popularMovie.posterPath}',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
