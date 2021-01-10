import 'package:flutter/material.dart';

import 'package:flutter_app_alti/models/pokemon.dart';
import 'package:flutter_app_alti/ui/dikey_tasarim/dikey_detay_ekran_tasarimi.dart';
import 'package:flutter_app_alti/ui/yatay_tasarim/yatay_detay_ekran_tasarim.dart';

class PokemonDetay extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetay({this.pokemon});

  @override
  _PokemonDetayState createState() => _PokemonDetayState();
}

class _PokemonDetayState extends State<PokemonDetay> {
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = widget.pokemon;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: ustBarTasarim(context),
      body: ekranaGoreDizayn(pokemon),
    );
  }

  AppBar ustBarTasarim(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: ustBarBaslik(),
      centerTitle: true,
      leading: geriTusuDizayn(context),
    );
  }

  IconButton geriTusuDizayn(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.blueGrey,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Text ustBarBaslik() {
    return Text(
      "Seçilen Pokemon Özellikleri",
      style: TextStyle(color: Colors.blueGrey),
    );
  }

  OrientationBuilder ekranaGoreDizayn(Pokemon pokemon) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return DikeyDetaySayfasiTasarim(pokemon: pokemon);
        } else {
          return YatayDetaySayfasiTasarim(pokemon: pokemon);
        }
      },
    );
  }
}
