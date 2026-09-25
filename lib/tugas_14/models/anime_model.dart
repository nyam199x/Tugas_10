// To parse this JSON data, do
//
//     final animeModel = animeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';

part 'anime_model.g.dart';

AnimeModel animeModelFromJson(String str) =>
    AnimeModel.fromJson(json.decode(str));

String animeModelToJson(AnimeModel data) => json.encode(data.toJson());

@JsonSerializable()
class AnimeModel {
  @JsonKey(name: "pagination")
  final Pagination? pagination;
  @JsonKey(name: "data")
  final List<Datum>? data;

  AnimeModel({this.pagination, this.data});

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "mal_id")
  final int? malId;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "images")
  final Map<String, Image>? images;
  @JsonKey(name: "trailer")
  final Trailer? trailer;
  @JsonKey(name: "approved")
  final bool? approved;
  @JsonKey(name: "titles")
  final List<Title>? titles;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "title_english")
  final String? titleEnglish;
  @JsonKey(name: "title_japanese")
  final String? titleJapanese;
  @JsonKey(name: "title_synonyms")
  final List<String>? titleSynonyms;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "source")
  final String? source;
  @JsonKey(name: "episodes")
  final int? episodes;
  @JsonKey(name: "status")
  final Status? status;
  @JsonKey(name: "airing")
  final bool? airing;
  @JsonKey(name: "aired")
  final Aired? aired;
  @JsonKey(name: "duration")
  final String? duration;
  @JsonKey(name: "rating")
  final Rating? rating;
  @JsonKey(name: "score")
  final double? score;
  @JsonKey(name: "scored_by")
  final int? scoredBy;
  @JsonKey(name: "rank")
  final int? rank;
  @JsonKey(name: "popularity")
  final int? popularity;
  @JsonKey(name: "members")
  final int? members;
  @JsonKey(name: "favorites")
  final int? favorites;
  @JsonKey(name: "synopsis")
  final String? synopsis;
  @JsonKey(name: "background")
  final String? background;
  @JsonKey(name: "season")
  final Season? season;
  @JsonKey(name: "year")
  final int? year;
  @JsonKey(name: "broadcast")
  final Broadcast? broadcast;
  @JsonKey(name: "producers")
  final List<Demographic>? producers;
  @JsonKey(name: "licensors")
  final List<Demographic>? licensors;
  @JsonKey(name: "studios")
  final List<Demographic>? studios;
  @JsonKey(name: "genres")
  final List<Demographic>? genres;
  @JsonKey(name: "explicit_genres")
  final List<dynamic>? explicitGenres;
  @JsonKey(name: "themes")
  final List<Demographic>? themes;
  @JsonKey(name: "demographics")
  final List<Demographic>? demographics;

  Datum({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Aired {
  @JsonKey(name: "from")
  final DateTime? from;
  @JsonKey(name: "to")
  final DateTime? to;
  @JsonKey(name: "prop")
  final Prop? prop;
  @JsonKey(name: "string")
  final String? string;

  Aired({this.from, this.to, this.prop, this.string});

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

  Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Prop {
  @JsonKey(name: "from")
  final From? from;
  @JsonKey(name: "to")
  final From? to;

  Prop({this.from, this.to});

  factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

  Map<String, dynamic> toJson() => _$PropToJson(this);
}

@JsonSerializable()
class From {
  @JsonKey(name: "day")
  final int? day;
  @JsonKey(name: "month")
  final int? month;
  @JsonKey(name: "year")
  final int? year;

  From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class Broadcast {
  @JsonKey(name: "day")
  final String? day;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "timezone")
  final Timezone? timezone;
  @JsonKey(name: "string")
  final String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) =>
      _$BroadcastFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

enum Timezone {
  @JsonValue("Asia/Tokyo")
  ASIA_TOKYO,
}

final timezoneValues = EnumValues({"Asia/Tokyo": Timezone.ASIA_TOKYO});

@JsonSerializable()
class Demographic {
  @JsonKey(name: "mal_id")
  final int? malId;
  @JsonKey(name: "type")
  final DemographicType? type;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "url")
  final String? url;

  Demographic({this.malId, this.type, this.name, this.url});

  factory Demographic.fromJson(Map<String, dynamic> json) =>
      _$DemographicFromJson(json);

  Map<String, dynamic> toJson() => _$DemographicToJson(this);
}

enum DemographicType {
  @JsonValue("anime")
  ANIME,
}

final demographicTypeValues = EnumValues({"anime": DemographicType.ANIME});

@JsonSerializable()
class Image {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  Image({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

enum Rating {
  @JsonValue("PG-13 - Teens 13 or older")
  PG_13_TEENS_13_OR_OLDER,
  @JsonValue("R - 17+ (violence & profanity)")
  R_17_VIOLENCE_PROFANITY,
}

final ratingValues = EnumValues({
  "PG-13 - Teens 13 or older": Rating.PG_13_TEENS_13_OR_OLDER,
  "R - 17+ (violence & profanity)": Rating.R_17_VIOLENCE_PROFANITY,
});

enum Season {
  @JsonValue("fall")
  FALL,
  @JsonValue("spring")
  SPRING,
  @JsonValue("summer")
  SUMMER,
  @JsonValue("winter")
  WINTER,
}

final seasonValues = EnumValues({
  "fall": Season.FALL,
  "spring": Season.SPRING,
  "summer": Season.SUMMER,
  "winter": Season.WINTER,
});

enum Status {
  @JsonValue("Currently Airing")
  CURRENTLY_AIRING,
  @JsonValue("Finished Airing")
  FINISHED_AIRING,
}

final statusValues = EnumValues({
  "Currently Airing": Status.CURRENTLY_AIRING,
  "Finished Airing": Status.FINISHED_AIRING,
});

@JsonSerializable()
class Title {
  @JsonKey(name: "type")
  final TitleType? type;
  @JsonKey(name: "title")
  final String? title;

  Title({this.type, this.title});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}

enum TitleType {
  @JsonValue("Default")
  DEFAULT,
  @JsonValue("English")
  ENGLISH,
  @JsonValue("French")
  FRENCH,
  @JsonValue("German")
  GERMAN,
  @JsonValue("Japanese")
  JAPANESE,
  @JsonValue("Spanish")
  SPANISH,
  @JsonValue("Synonym")
  SYNONYM,
}

final titleTypeValues = EnumValues({
  "Default": TitleType.DEFAULT,
  "English": TitleType.ENGLISH,
  "French": TitleType.FRENCH,
  "German": TitleType.GERMAN,
  "Japanese": TitleType.JAPANESE,
  "Spanish": TitleType.SPANISH,
  "Synonym": TitleType.SYNONYM,
});

@JsonSerializable()
class Trailer {
  @JsonKey(name: "youtube_id")
  final dynamic youtubeId;
  @JsonKey(name: "url")
  final dynamic url;
  @JsonKey(name: "embed_url")
  final String? embedUrl;
  @JsonKey(name: "images")
  final Images? images;

  Trailer({this.youtubeId, this.url, this.embedUrl, this.images});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: "image_url")
  final dynamic imageUrl;
  @JsonKey(name: "small_image_url")
  final dynamic smallImageUrl;
  @JsonKey(name: "medium_image_url")
  final dynamic mediumImageUrl;
  @JsonKey(name: "large_image_url")
  final dynamic largeImageUrl;
  @JsonKey(name: "maximum_image_url")
  final dynamic maximumImageUrl;

  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "last_visible_page")
  final int? lastVisiblePage;
  @JsonKey(name: "has_next_page")
  final bool? hasNextPage;
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "items")
  final Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Items {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "per_page")
  final int? perPage;

  Items({this.count, this.total, this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
