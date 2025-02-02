import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_services.dart';

class MovieDetail extends StatefulWidget {
  final MovieModel movieDetail;

  const MovieDetail({
    super.key,
    required this.movieDetail,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

String timeFormat(num time) {
  num hour = time / 60;
  num minute = time % 60;

  return '${hour.floor()}h ${minute}min';
}

Row makeStars(num voteAverage) {
  int score = voteAverage.floor();
  int starCount = (score / 2).ceil();
  int halfPosition = -1;

  if (score % 2 == 1) {
    halfPosition = (score / 2).floor();
  }

  List<Icon> icons = [];
  for (num i = 0; i < 5; i++) {
    IconData iconData = Icons.star_outlined;
    if (i == halfPosition) {
      iconData = Icons.star_half_outlined;
    }

    if (i < starCount) {
      icons.add(
        Icon(iconData, color: Colors.amber),
      );
    } else {
      icons.add(
        Icon(iconData, color: Colors.white38),
      );
    }
  }

  return Row(children: icons);
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = MovieApiServices.getMovieById(widget.movieDetail.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Back to list',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movieData = snapshot.data!;

            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${MovieApiServices.imageBaseUrl}${snapshot.data!.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                      ),
                      Text(
                        movieData.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      makeStars(movieData.voteAverage),
                      Text(
                        '${movieData.voteAverage}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Text(
                        '${timeFormat(movieData.runtime)} | ${movieData.genres.map((genre) => genre.name).join(', ')}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Text(
                        'Storyline',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Text(
                        movieData.overview,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Spacer(flex: 2),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .25,
                              ),
                              minimumSize: Size(0, 50),
                              backgroundColor: Colors.amberAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(
                            'Buy Ticket',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
