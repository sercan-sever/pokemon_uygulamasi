import 'package:flutter/material.dart';
import 'package:flutter_app_alti/models/pokemon.dart';

class DikeyDetaySayfasiTasarim extends StatelessWidget {
  const DikeyDetaySayfasiTasarim({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ozellikleri(context),
        resim(),
      ],
    );
  }

  Positioned ozellikleri(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width - 20,
      left: 10,
      top: MediaQuery.of(context).size.height * 0.1,
      child: tasarim(context),
    );
  }

  Card tasarim(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: karakterOzellikleri(context),
    );
  }

  Column karakterOzellikleri(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
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

  Align resim() {
    return Align(
      alignment: Alignment.topCenter,
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
