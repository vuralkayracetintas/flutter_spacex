// // To parse this JSON data, do
// //
// //     final PastLaunchModel = PastLaunchModelFromMap(jsonString);

// import 'dart:convert';

// PastLaunchModel pastLaunchModelFromMap(String str) =>
//     PastLaunchModel.fromMap(json.decode(str));

// String pastLaunchModelToMap(PastLaunchModel data) => json.encode(data.toMap());

// ///
// class PastLaunchModel {
//   Links links;
//   String? rocket;
//   bool? success;
//   String? details;
//   List<String> crew;
//   List<String> capsules;

//   int? flightNumber;
//   String? name;
//   DateTime? dateUtc;
//   int? dateUnix;
//   DateTime? dateLocal;
//   String? datePrecision;
//   String? id;

//   PastLaunchModel({
//     required this.links,
//     required this.rocket,
//     required this.success,
//     required this.details,
//     required this.crew,
//     required this.capsules,
//     required this.flightNumber,
//     required this.name,
//     required this.dateUtc,
//     required this.dateUnix,
//     required this.dateLocal,
//     required this.datePrecision,
//     required this.id,
//   });

//   PastLaunchModel copyWith({
//     Links? links,
//     DateTime? staticFireDateUtc,
//     String? rocket,
//     bool? success,
//     String? details,
//     List<String>? crew,
//     List<String>? capsules,
//     List<String>? payloads,
//     String? launchpad,
//     int? flightNumber,
//     String? name,
//     DateTime? dateUtc,
//     int? dateUnix,
//     DateTime? dateLocal,
//     String? datePrecision,
//     String? id,
//   }) =>
//       PastLaunchModel(
//         links: links ?? this.links,
//         rocket: rocket ?? this.rocket,
//         success: success ?? this.success,
//         details: details ?? this.details,
//         crew: crew ?? this.crew,
//         capsules: capsules ?? this.capsules,
//         flightNumber: flightNumber ?? this.flightNumber,
//         name: name ?? this.name,
//         dateUtc: dateUtc ?? this.dateUtc,
//         dateUnix: dateUnix ?? this.dateUnix,
//         dateLocal: dateLocal ?? this.dateLocal,
//         datePrecision: datePrecision ?? this.datePrecision,
//         id: id ?? this.id,
//       );

//   factory PastLaunchModel.fromMap(Map<String, dynamic> json) => PastLaunchModel(
//         links: Links.fromMap(json["links"]),
//         rocket: json["rocket"],
//         success: json["success"],
//         details: json["details"],
//         crew: List<String>.from(json["crew"].map((x) => x)),
//         capsules: List<String>.from(json["capsules"].map((x) => x)),
//         flightNumber: json["flight_number"],
//         name: json["name"],
//         dateUtc: DateTime.parse(json["date_utc"]),
//         dateUnix: json["date_unix"],
//         dateLocal: DateTime.parse(json["date_local"]),
//         datePrecision: json["date_precision"],
//         id: json["id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "links": links.toMap(),
//         "rocket": rocket,
//         "success": success,
//         "details": details,
//         "crew": List<dynamic>.from(crew.map((x) => x)),
//         "capsules": List<dynamic>.from(capsules.map((x) => x)),
//         "flight_number": flightNumber,
//         "name": name,
//         "date_utc": dateUtc?.toIso8601String(),
//         "date_unix": dateUnix,
//         "date_local": dateLocal?.toIso8601String(),
//         "date_precision": datePrecision,
//         "id": id,
//       };
// }

// class Links {
//   Patch? patch;
//   Reddit? reddit;
//   Flickr? flickr;
//   String? presskit;
//   String? webcast;
//   String? youtubeId;

//   Links({
//     required this.patch,
//     required this.reddit,
//     required this.flickr,
//     required this.presskit,
//     required this.webcast,
//     required this.youtubeId,
//   });

//   Links copyWith({
//     Patch? patch,
//     Reddit? reddit,
//     Flickr? flickr,
//     String? presskit,
//     String? webcast,
//     String? youtubeId,
//     String? article,
//   }) =>
//       Links(
//         patch: patch ?? this.patch,
//         reddit: reddit ?? this.reddit,
//         flickr: flickr ?? this.flickr,
//         presskit: presskit ?? this.presskit,
//         webcast: webcast ?? this.webcast,
//         youtubeId: youtubeId ?? this.youtubeId,
//       );

//   factory Links.fromMap(Map<String, dynamic> json) => Links(
//         patch: Patch.fromMap(json["patch"]),
//         reddit: Reddit.fromMap(json["reddit"]),
//         flickr: Flickr.fromMap(json["flickr"]),
//         presskit: json["presskit"],
//         webcast: json["webcast"],
//         youtubeId: json["youtube_id"],
//       );

//   Map<String, dynamic> toMap() => {
//         "patch": patch?.toMap(),
//         "reddit": reddit?.toMap(),
//         "flickr": flickr?.toMap(),
//         "presskit": presskit,
//         "webcast": webcast,
//         "youtube_id": youtubeId,
//       };
// }

// class Flickr {
//   List<String> small;
//   List<String> original;

//   Flickr({
//     required this.small,
//     required this.original,
//   });

//   Flickr copyWith({
//     List<String>? small,
//     List<String>? original,
//   }) =>
//       Flickr(
//         small: small ?? this.small,
//         original: original ?? this.original,
//       );

//   factory Flickr.fromMap(Map<String, dynamic> json) => Flickr(
//         small: List<String>.from(json["small"].map((x) => x)),
//         original: List<String>.from(json["original"].map((x) => x)),
//       );

//   Map<String, dynamic> toMap() => {
//         "small": List<dynamic>.from(small.map((x) => x)),
//         "original": List<dynamic>.from(original.map((x) => x)),
//       };
// }

// class Patch {
//   String? small;
//   String? large;

//   Patch({
//     required this.small,
//     required this.large,
//   });

//   Patch copyWith({
//     String? small,
//     String? large,
//   }) =>
//       Patch(
//         small: small ?? this.small,
//         large: large ?? this.large,
//       );

//   factory Patch.fromMap(Map<String, dynamic> json) => Patch(
//         small: json["small"],
//         large: json["large"],
//       );

//   Map<String, dynamic> toMap() => {
//         "small": small,
//         "large": large,
//       };
// }

// class Reddit {
//   String? campaign;
//   String? launch;
//   String? media;

//   Reddit({
//     required this.campaign,
//     required this.launch,
//     required this.media,
//   });

//   Reddit copyWith({
//     String? campaign,
//     String? launch,
//     String? media,
//   }) =>
//       Reddit(
//         campaign: campaign ?? this.campaign,
//         launch: launch ?? this.launch,
//         media: media ?? this.media,
//       );

//   factory Reddit.fromMap(Map<String, dynamic> json) => Reddit(
//         campaign: json["campaign"],
//         launch: json["launch"],
//         media: json["media"],
//       );

//   Map<String, dynamic> toMap() => {
//         "campaign": campaign,
//         "launch": launch,
//         "media": media,
//       };
// }

// To parse this JSON data, do
//
//     final pastLaunchModel = pastLaunchModelFromMap(jsonString);

import 'dart:convert';

PastLaunchModel pastLaunchModelFromMap(String str) =>
    PastLaunchModel.fromMap(json.decode(str));

String pastLaunchModelToMap(PastLaunchModel data) => json.encode(data.toMap());

class PastLaunchModel {
  dynamic fairings;
  Links? links;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? tdb;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<dynamic>? failures;
  String? details;
  List<dynamic>? crew;
  List<dynamic>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String? launchpad;
  bool? autoUpdate;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Core>? cores;
  String? id;

  PastLaunchModel({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.tdb,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.autoUpdate,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.id,
  });

  PastLaunchModel copyWith({
    dynamic fairings,
    Links? links,
    DateTime? staticFireDateUtc,
    int? staticFireDateUnix,
    bool? tdb,
    bool? net,
    int? window,
    String? rocket,
    bool? success,
    List<dynamic>? failures,
    String? details,
    List<dynamic>? crew,
    List<dynamic>? ships,
    List<String>? capsules,
    List<String>? payloads,
    String? launchpad,
    bool? autoUpdate,
    int? flightNumber,
    String? name,
    DateTime? dateUtc,
    int? dateUnix,
    DateTime? dateLocal,
    String? datePrecision,
    bool? upcoming,
    List<Core>? cores,
    String? id,
  }) =>
      PastLaunchModel(
        fairings: fairings ?? this.fairings,
        links: links ?? this.links,
        staticFireDateUtc: staticFireDateUtc ?? this.staticFireDateUtc,
        staticFireDateUnix: staticFireDateUnix ?? this.staticFireDateUnix,
        tdb: tdb ?? this.tdb,
        net: net ?? this.net,
        window: window ?? this.window,
        rocket: rocket ?? this.rocket,
        success: success ?? this.success,
        failures: failures ?? this.failures,
        details: details ?? this.details,
        crew: crew ?? this.crew,
        ships: ships ?? this.ships,
        capsules: capsules ?? this.capsules,
        payloads: payloads ?? this.payloads,
        launchpad: launchpad ?? this.launchpad,
        autoUpdate: autoUpdate ?? this.autoUpdate,
        flightNumber: flightNumber ?? this.flightNumber,
        name: name ?? this.name,
        dateUtc: dateUtc ?? this.dateUtc,
        dateUnix: dateUnix ?? this.dateUnix,
        dateLocal: dateLocal ?? this.dateLocal,
        datePrecision: datePrecision ?? this.datePrecision,
        upcoming: upcoming ?? this.upcoming,
        cores: cores ?? this.cores,
        id: id ?? this.id,
      );

  factory PastLaunchModel.fromMap(Map<String, dynamic> json) => PastLaunchModel(
        fairings: json["fairings"],
        links: json["links"] == null ? null : Links.fromMap(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        tdb: json["tdb"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null
            ? []
            : List<dynamic>.from(json["failures"]!.map((x) => x)),
        details: json["details"],
        crew: json["crew"] == null
            ? []
            : List<dynamic>.from(json["crew"]!.map((x) => x)),
        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null
            ? []
            : List<String>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null
            ? []
            : List<String>.from(json["payloads"]!.map((x) => x)),
        launchpad: json["launchpad"],
        autoUpdate: json["auto_update"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc:
            json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null
            ? null
            : DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"]!.map((x) => Core.fromMap(x))),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "fairings": fairings,
        "links": links?.toMap(),
        "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "tdb": tdb,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures":
            failures == null ? [] : List<dynamic>.from(failures!.map((x) => x)),
        "details": details,
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x)),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules":
            capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads":
            payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "auto_update": autoUpdate,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": cores == null
            ? []
            : List<dynamic>.from(cores!.map((x) => x.toMap())),
        "id": id,
      };
}

class Core {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  bool? landingSuccess;
  String? landingType;
  String? landpad;

  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  Core copyWith({
    String? core,
    int? flight,
    bool? gridfins,
    bool? legs,
    bool? reused,
    bool? landingAttempt,
    bool? landingSuccess,
    String? landingType,
    String? landpad,
  }) =>
      Core(
        core: core ?? this.core,
        flight: flight ?? this.flight,
        gridfins: gridfins ?? this.gridfins,
        legs: legs ?? this.legs,
        reused: reused ?? this.reused,
        landingAttempt: landingAttempt ?? this.landingAttempt,
        landingSuccess: landingSuccess ?? this.landingSuccess,
        landingType: landingType ?? this.landingType,
        landpad: landpad ?? this.landpad,
      );

  factory Core.fromMap(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
      );

  Map<String, dynamic> toMap() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
      };
}

class Links {
  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Links copyWith({
    Patch? patch,
    Reddit? reddit,
    Flickr? flickr,
    String? presskit,
    String? webcast,
    String? youtubeId,
    String? article,
    String? wikipedia,
  }) =>
      Links(
        patch: patch ?? this.patch,
        reddit: reddit ?? this.reddit,
        flickr: flickr ?? this.flickr,
        presskit: presskit ?? this.presskit,
        webcast: webcast ?? this.webcast,
        youtubeId: youtubeId ?? this.youtubeId,
        article: article ?? this.article,
        wikipedia: wikipedia ?? this.wikipedia,
      );

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromMap(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromMap(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromMap(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toMap() => {
        "patch": patch?.toMap(),
        "reddit": reddit?.toMap(),
        "flickr": flickr?.toMap(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  List<dynamic>? small;
  List<String>? original;

  Flickr({
    this.small,
    this.original,
  });

  Flickr copyWith({
    List<dynamic>? small,
    List<String>? original,
  }) =>
      Flickr(
        small: small ?? this.small,
        original: original ?? this.original,
      );

  factory Flickr.fromMap(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null
            ? []
            : List<dynamic>.from(json["small"]!.map((x) => x)),
        original: json["original"] == null
            ? []
            : List<String>.from(json["original"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "small": small == null ? [] : List<dynamic>.from(small!.map((x) => x)),
        "original":
            original == null ? [] : List<dynamic>.from(original!.map((x) => x)),
      };
}

class Patch {
  String? small;
  String? large;

  Patch({
    this.small,
    this.large,
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
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
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
