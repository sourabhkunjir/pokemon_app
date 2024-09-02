import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/data/models/pokemon.dart';
import 'package:pokemon_app/ui/widgets/detail_pokemon_description.dart';
import 'package:pokemon_app/utils/helpers.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Helpers.getPokemonCardColour(
          pokemonType: pokemon.typeofpokemon!.first),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Helpers.getPokemonCardColour(
            pokemonType: pokemon.typeofpokemon!.first),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemon.name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  pokemon.id!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.57,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pokemon.xdescription!),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailPokemonDescription(width: width, title: "Name", value: pokemon.name!),
                  DetailPokemonDescription(width: width, title: "Type", value: pokemon.typeofpokemon!.join(", ")),
                  DetailPokemonDescription(width: width, title: "Speed", value: pokemon.speed.toString()),
                  DetailPokemonDescription(width: width, title: "Hp", value: pokemon.hp.toString()),
                  DetailPokemonDescription(width: width, title: "Attack", value: pokemon.attack.toString()),
                  DetailPokemonDescription(width: width, title: "Height", value: pokemon.height!),
                  DetailPokemonDescription(width: width, title: "Weakness", value: pokemon.weaknesses!.join(", ")),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.16,
            left: (width / 2) - 100,
            child: Image.asset(
              "assets/images/pokeball.png",
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
              top: height * 0.16,
              left: (width / 2) - 100,
              child: Hero(
                tag: pokemon.id!,
                child: CachedNetworkImage(
                  imageUrl: pokemon.imageurl!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fitWidth,
                ),
              ))
        ],
      ),
    );
  }
}


