// To parse this JSON data, do
//
//     final PastLaunchModel = PastLaunchModelFromMap(jsonString);

import 'dart:convert';

PastLaunchModel PastLaunchModelFromMap(String str) =>
    PastLaunchModel.fromMap(json.decode(str));

String PastLaunchModelToMap(PastLaunchModel data) => json.encode(data.toMap());

class PastLaunchModel {
  Links links;

  String? rocket;
  bool? success;
  String? details;
  List<String> crew;
  List<String> capsules;
  List<String> payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  String? datePrecision;
  String? id;

  PastLaunchModel({
    required this.links,
    required this.rocket,
    required this.success,
    required this.details,
    required this.crew,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.id,
  });

  PastLaunchModel copyWith({
    Links? links,
    DateTime? staticFireDateUtc,
    String? rocket,
    bool? success,
    String? details,
    List<String>? crew,
    List<String>? capsules,
    List<String>? payloads,
    String? launchpad,
    int? flightNumber,
    String? name,
    DateTime? dateUtc,
    int? dateUnix,
    DateTime? dateLocal,
    String? datePrecision,
    String? id,
  }) =>
      PastLaunchModel(
        links: links ?? this.links,
        rocket: rocket ?? this.rocket,
        success: success ?? this.success,
        details: details ?? this.details,
        crew: crew ?? this.crew,
        capsules: capsules ?? this.capsules,
        payloads: payloads ?? this.payloads,
        launchpad: launchpad ?? this.launchpad,
        flightNumber: flightNumber ?? this.flightNumber,
        name: name ?? this.name,
        dateUtc: dateUtc ?? this.dateUtc,
        dateUnix: dateUnix ?? this.dateUnix,
        dateLocal: dateLocal ?? this.dateLocal,
        datePrecision: datePrecision ?? this.datePrecision,
        id: id ?? this.id,
      );

  factory PastLaunchModel.fromMap(Map<String, dynamic> json) => PastLaunchModel(
        links: Links.fromMap(json["links"]),
        rocket: json["rocket"],
        success: json["success"],
        details: json["details"],
        crew: List<String>.from(json["crew"].map((x) => x)),
        capsules: List<String>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "links": links.toMap(),
        "rocket": rocket,
        "success": success,
        "details": details,
        "crew": List<dynamic>.from(crew.map((x) => x)),
        "capsules": List<dynamic>.from(capsules.map((x) => x)),
        "payloads": List<dynamic>.from(payloads.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "id": id,
      };
}

class Links {
  Patch patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtubeId;

  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
  });

  Links copyWith({
    Patch? patch,
    Reddit? reddit,
    Flickr? flickr,
    String? presskit,
    String? webcast,
    String? youtubeId,
    String? article,
  }) =>
      Links(
        patch: patch ?? this.patch,
        reddit: reddit ?? this.reddit,
        flickr: flickr ?? this.flickr,
        presskit: presskit ?? this.presskit,
        webcast: webcast ?? this.webcast,
        youtubeId: youtubeId ?? this.youtubeId,
      );

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        patch: Patch.fromMap(json["patch"]),
        reddit: Reddit.fromMap(json["reddit"]),
        flickr: Flickr.fromMap(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
      );

  Map<String, dynamic> toMap() => {
        "patch": patch.toMap(),
        "reddit": reddit?.toMap(),
        "flickr": flickr?.toMap(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
      };
}

class Flickr {
  List<String> small;
  List<String> original;

  Flickr({
    required this.small,
    required this.original,
  });

  Flickr copyWith({
    List<String>? small,
    List<String>? original,
  }) =>
      Flickr(
        small: small ?? this.small,
        original: original ?? this.original,
      );

  factory Flickr.fromMap(Map<String, dynamic> json) => Flickr(
        small: List<String>.from(json["small"].map((x) => x)),
        original: List<String>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "small": List<dynamic>.from(small.map((x) => x)),
        "original": List<dynamic>.from(original.map((x) => x)),
      };
}

class Patch {
  String? small;
  String? large;

  Patch({
    required this.small,
    required this.large,
  });

  Patch copyWith({
    String? small,
    String? large,
  }) =>
      Patch(
        small: small ?? this.small,
        large: large ?? this.large,
      );

  factory Patch.fromMap(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "large": large,
      };
}

class Reddit {
  String? campaign;
  String? launch;
  String? media;
  dynamic recovery;

  Reddit({
    required this.campaign,
    required this.launch,
    required this.media,
    required this.recovery,
  });

  Reddit copyWith({
    String? campaign,
    String? launch,
    String? media,
    dynamic recovery,
  }) =>
      Reddit(
        campaign: campaign ?? this.campaign,
        launch: launch ?? this.launch,
        media: media ?? this.media,
        recovery: recovery ?? this.recovery,
      );

  factory Reddit.fromMap(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );

  Map<String, dynamic> toMap() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
      };
}
