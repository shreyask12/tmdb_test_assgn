class MovieDetailsModel {
  int? id;
  int? budget;
  int? revenue;
  int? runtime;
  int? voteCount;
  num? voteAverage;
  bool? adult;
  bool? video;
  String? title;
  String? imdbId;
  String? status;
  String? tagline;
  String? homepage;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? backdropPath;
  String? originalTitle;
  String? originalLanguage;
  BelongsToCollectionModel? belongsToCollection;
  List<GenresModel>? genres;
  List<SpokenLanguagesModel>? spokenLanguages;
  List<ProductionCountriesModel>? productionCountries;
  List<ProductionCompaniesModel>? productionCompanies;
  Videos? videos;
  Recommendations? recommendations;
  Credits? credits;

  MovieDetailsModel({
    this.id,
    this.budget,
    this.revenue,
    this.runtime,
    this.voteCount,
    this.voteAverage,
    this.adult,
    this.video,
    this.title,
    this.imdbId,
    this.status,
    this.tagline,
    this.homepage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.backdropPath,
    this.originalTitle,
    this.originalLanguage,
    this.belongsToCollection,
    this.genres,
    this.spokenLanguages,
    this.productionCountries,
    this.productionCompanies,
    this.videos,
    this.recommendations,
    this.credits,
  });

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    budget = json['budget'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
    adult = json['adult'];
    video = json['video'];
    title = json['title'];
    imdbId = json['imdb_id'];
    status = json['status'];
    tagline = json['tagline'];
    homepage = json['homepage'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollectionModel.fromJson(json['belongs_to_collection'])
        : null;
    if (json['genres'] != null) {
      genres = <GenresModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenresModel.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguagesModel>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguagesModel.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountriesModel>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountriesModel.fromJson(v));
      });
    }
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompaniesModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompaniesModel.fromJson(v));
      });
    }

    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    credits =
        json['credits'] != null ? Credits.fromJson(json['credits']) : null;
  }
}

class BelongsToCollectionModel {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
}

class GenresModel {
  int? id;
  String? name;

  GenresModel({
    this.id,
    this.name,
  });

  GenresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProductionCompaniesModel {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  ProductionCompaniesModel({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }
}

class ProductionCountriesModel {
  String? name;
  String? iso31661;

  ProductionCountriesModel({
    this.name,
    this.iso31661,
  });

  ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso31661 = json['iso_3166_1'];
  }
}

class SpokenLanguagesModel {
  String? name;
  String? iso6391;
  String? englishName;

  SpokenLanguagesModel({
    this.name,
    this.iso6391,
    this.englishName,
  });

  SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso6391 = json['iso_639_1'];
    englishName = json['english_name'];
  }
}

class Videos {
  List<VideoResults>? results;

  Videos({this.results});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <VideoResults>[];
      json['results'].forEach((v) {
        results!.add(VideoResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoResults {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  VideoResults(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  VideoResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}

class Recommendations {
  int? page;
  List<Results>? results;

  Recommendations({this.page, this.results});

  Recommendations.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({this.cast, this.crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      data['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}

class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['credit_id'] = creditId;
    data['department'] = department;
    data['job'] = job;
    return data;
  }
}
