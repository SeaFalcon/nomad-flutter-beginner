import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_services.dart';
import 'package:toonflix/widgets/components/movie_others.dart';
import 'package:toonflix/widgets/components/movie_popular.dart';

class MovieflixMain extends StatefulWidget {
  const MovieflixMain({super.key});

  @override
  State<MovieflixMain> createState() => _MovieflixMainState();
}

class _MovieflixMainState extends State<MovieflixMain> {
  late Future<List<MovieModel>> popularMovies;
  late Future<List<MovieModel>> nowPlayingMovies;
  late Future<List<MovieModel>> comingSoonMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = MovieApiServices.getMoviesByFilter(0);
    nowPlayingMovies = MovieApiServices.getMoviesByFilter(1);
    comingSoonMovies = MovieApiServices.getMoviesByFilter(2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Popular Movies',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return makePopular(snapshot);
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              renderOtherMovies(
                context: context,
                type: 'Now in Cinemas',
                movies: nowPlayingMovies,
              ),
              renderOtherMovies(
                context: context,
                type: 'Coming soon',
                movies: comingSoonMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column renderOtherMovies({
  required BuildContext context,
  required String type,
  required Future<List<MovieModel>> movies,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        type,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return makeOtherMovie(snapshot);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    ],
  );
}

ListView makePopular(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    padding: EdgeInsets.symmetric(vertical: 20),
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      var movieItem = snapshot.data![index];
      return PopularMovie(popularMovie: movieItem);
    },
    separatorBuilder: (context, index) {
      return SizedBox(width: 15);
    },
  );
}

ListView makeOtherMovie(AsyncSnapshot<List<MovieModel>> snapshot) {
  return ListView.separated(
    padding: EdgeInsets.symmetric(vertical: 20),
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      var movieItem = snapshot.data![index];
      return OtherMovie(movie: movieItem);
    },
    separatorBuilder: (context, index) {
      return SizedBox(width: 15);
    },
  );
}
