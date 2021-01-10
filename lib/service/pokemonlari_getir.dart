import 'package:flutter_app_alti/models/pokedex.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

Pokedex pokedex;

Future<Pokedex> pokemonleriGetir() async {
  var response = await http.get(url);
  var decodedJson = json.decode(response.body);
  pokedex = Pokedex.fromJson(decodedJson);
  return pokedex;
}
