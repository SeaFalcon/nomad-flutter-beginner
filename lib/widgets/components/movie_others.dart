import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_services.dart';

class OtherMovie extends StatelessWidget {
  final MovieModel movie;

  const OtherMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width * .35,
          height: MediaQuery.of(context).size.width * .35,
          child: Image.network(
            '${MovieApiServices.imageBaseUrl}${movie.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
          width: MediaQuery.of(context).size.width * .35,
          child: Text(
            movie.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.2,
              overflow: TextOverflow.visible,
            ),
          ),
        )
      ],
    );
  }
}
