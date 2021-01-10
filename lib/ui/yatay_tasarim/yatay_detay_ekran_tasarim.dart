import 'package:flutter/material.dart';
import 'package:flutter_app_alti/models/pokemon.dart';

class YatayDetaySayfasiTasarim extends StatelessWidget {
  const YatayDetaySayfasiTasarim({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return tasarim(context);
  }

  SizedBox tasarim(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width - 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              resim(),
              ozellikleri(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ozellikleri() {
    return Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: karakterOzellikleri(),
      ),
    );
  }

  Column karakterOzellikleri() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        karakterAdi(),
        karakterBoyuVeAgirligi(),
        Text(
          "Türü",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        karakterTuruIcerigi(),
        Text(
          "İlk Hali",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        karakterinIlkHali(),
        Text(
          "Sonraki Evrimi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        karakterinSonEvrimi(),
        Text(
          "Zayıf Yönleri",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        karakterZayifYonleri(),
      ],
    );
  }

  Row karakterZayifYonleri() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pokemon.weaknesses != null
          ? pokemon.weaknesses.map(
              (value) {
                return Chip(
                  label: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blueGrey,
                );
              },
            ).toList()
          : [
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "Zayıf Yönleri Yok",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
    );
  }

  Row karakterinSonEvrimi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pokemon.nextEvolution != null
          ? pokemon.nextEvolution.map(
              (value) {
                return Chip(
                  label: Text(
                    value.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blueGrey,
                );
              },
            ).toList()
          : [
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "Evrim Geçirmiyor",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
    );
  }

  Row karakterinIlkHali() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pokemon.prevEvolution != null
          ? pokemon.prevEvolution.map(
              (value) {
                return Chip(
                  label: Text(
                    value.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blueGrey,
                );
              },
            ).toList()
          : [
              Chip(
                backgroundColor: Colors.blueGrey,
                label: Text(
                  "İlk Hali",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
    );
  }

  Row karakterTuruIcerigi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pokemon.type.map(
        (value) {
          return Chip(
            label: Text(
              value,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blueGrey,
          );
        },
      ).toList(),
    );
  }

  Row karakterBoyuVeAgirligi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Chip(
          label: Text(
            "Boyu : " + pokemon.height,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        Chip(
          label: Text(
            "Ağırlığı : " + pokemon.weight,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
      ],
    );
  }

  Text karakterAdi() {
    return Text(
      pokemon.name,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Expanded resim() {
    return Expanded(
      flex: 2,
      child: Hero(
        tag: pokemon.img,
        child: Container(
          width: 150,
          height: 150,
          child: Image.network(
            pokemon.img,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
