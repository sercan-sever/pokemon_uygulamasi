import 'dart:convert';

import 'package:flutter_app_alti/models/pokemon.dart';

Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

String pokedexToJson(Pokedex data) => json.encode(data.toJson());

class Pokedex {
  Pokedex({
    this.pokemon,
  });

  List<Pokemon> pokemon;

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        pokemon: json["pokemon"] == null
            ? null
            : List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon == null ? null : List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}
