// To parse this JSON data, do
//
//     final quran = quranFromJson(jsonString);

import 'dart:convert';

Quran quranFromJson(String str) => Quran.fromJson(json.decode(str));

String quranToJson(Quran data) => json.encode(data.toJson());

class Quran {
  Quran({
    required this.reciters,
  });

  List<Reciter> reciters;

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
        reciters: List<Reciter>.from(
            json["reciters"].map((x) => Reciter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reciters": List<dynamic>.from(reciters.map((x) => x.toJson())),
      };
}

class Reciter {
  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.moshaf,
  });

  int id;
  String name;
  String letter;
  List<Moshaf> moshaf;

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json["id"],
        name: json["name"],
        letter: json["letter"],
        moshaf:
            List<Moshaf>.from(json["moshaf"].map((x) => Moshaf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "letter": letter,
        "moshaf": List<dynamic>.from(moshaf.map((x) => x.toJson())),
      };
}

class Moshaf {
  Moshaf({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.surahList,
  });

  int id;
  String name;
  String server;
  int surahTotal;
  String surahList;

  factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
        id: json["id"],
        name: json["name"],
        server: json["server"],
        surahTotal: json["surah_total"],
        surahList: json["surah_list"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "server": server,
        "surah_total": surahTotal,
        "surah_list": surahList,
      };
}
