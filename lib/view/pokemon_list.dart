import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_alti/models/pokedex.dart';
import 'package:flutter_app_alti/service/pokemonlari_getir.dart';
import 'package:flutter_app_alti/ui/dikey_tasarim/dikey_giris_ekran__tasarim.dart';
import 'package:flutter_app_alti/ui/yatay_tasarim/yatay_giris_ekran_tasarim.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  Future<Pokedex> veri;

  @override
  void initState() {
    super.initState();
    veri = pokemonleriGetir();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: ustBarTasarim(),
      body: ekranaGoreDizayn(),
    );
  }

  AppBar ustBarTasarim() {
    return AppBar(
      title: Text(
        "Pokemon Uygulaması",
        style: TextStyle(color: Colors.blueGrey),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  OrientationBuilder ekranaGoreDizayn() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return DikeyEkranTasarim(veri: veri);
        } else {
          return YatayEkran(veri: veri);
        }
      },
    );
  }
}
