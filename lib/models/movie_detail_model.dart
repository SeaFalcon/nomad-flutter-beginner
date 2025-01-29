class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final int budget;
  final int revenue;
  final int runtime;
  final String tagline;
  final String imdbId;
  final List<String> originCountry;
  final List<Genre> genres;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;

  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.imdbId,
    required this.originCountry,
    required this.genres,
    required this.productionCompanies,
    required this.productionCountries,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      tagline: json['tagline'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      genres: (json['genres'] as List)
          .map((genreJson) => Genre.fromJson(genreJson))
          .toList(),
      productionCompanies: (json['production_companies'] as List)
          .map((companyJson) => ProductionCompany.fromJson(companyJson))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((countryJson) => ProductionCountry.fromJson(countryJson))
          .toList(),
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountry {
  final String iso3166_1;
  final String name;

  ProductionCountry({
    required this.iso3166_1,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso3166_1: json['iso_3166_1'],
      name: json['name'],
    );
  }
}
