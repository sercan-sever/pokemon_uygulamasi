import 'package:flutter/material.dart';
import 'package:flutter_app_alti/models/pokedex.dart';
import 'package:flutter_app_alti/view/pokemon_detay.dart';

class YatayEkran extends StatelessWidget {
  const YatayEkran({
    Key key,
    @required this.veri,
  }) : super(key: key);

  final Future<Pokedex> veri;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: veri,
      builder: (context, AsyncSnapshot<Pokedex> snapshat) {
        return veriDurumKontrolu(snapshat, context);
      },
    );
  }

  Widget veriDurumKontrolu(AsyncSnapshot<Pokedex> snapshat, BuildContext context) {
    if (snapshat.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (snapshat.connectionState == ConnectionState.done) {
      return ListView.builder(
        itemExtent: MediaQuery.of(context).size.height * 0.30,
        itemCount: snapshat.data.pokemon.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: snapshat.data.pokemon[index].img,
            child: tasarim(context, snapshat, index),
          );
        },
      );
    } else {
      return null;
    }
  }

  Card tasarim(BuildContext context, AsyncSnapshot<Pokedex> snapshat, int index) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetay(
                pokemon: snapshat.data.pokemon[index],
              ),
            ),
          );
        },
        child: karakterOzeti(snapshat, index),
      ),
    );
  }

  Stack karakterOzeti(AsyncSnapshot<Pokedex> snapshat, int index) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ListTile(
          title: karakterAdi(snapshat, index),
          subtitle: karakterTuru(snapshat, index),
        ),
        resim(snapshat, index),
      ],
    );
  }

  Align resim(AsyncSnapshot<Pokedex> snapshat, int index) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/gif/yukleme.gif",
          image: snapshat.data.pokemon[index].img,
        ),
      ),
    );
  }

  Text karakterTuru(AsyncSnapshot<Pokedex> snapshat, int index) {
    return Text(
      snapshat.data.pokemon[index].type.toString(),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text karakterAdi(AsyncSnapshot<Pokedex> snapshat, int index) {
    return Text(
      snapshat.data.pokemon[index].name,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
