import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemon.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/ui/screens/pokemon_detail_screen.dart';
import 'package:pokemon_app/utils/helpers.dart';

class AllPokemonScreen extends ConsumerWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Pokemon>> allPokemon = ref.watch(pokemonFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        centerTitle: true,
      ),
      body: allPokemon.when(
        data: (pokemonData) {
          return GridView.builder(
            itemCount: pokemonData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              final pokemon = pokemonData[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PokemonDetailScreen(pokemon:pokemon),
                  )); 
                },
                child: Card(
                  color: Helpers.getPokemonCardColour(
                      pokemonType: pokemon.typeofpokemon!.first),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Text(
                          pokemon.name!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                pokemon.typeofpokemon!.first,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -14,
                        bottom: 10,
                        child: Image.asset(
                          "assets/images/pokeball.png",
                          width: 110,
                          height: 110,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -10,
                        child: Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            width: 120,
                            height: 120,
                            imageUrl: pokemon.imageurl!,
                            placeholder: (context, url) => SizedBox(
                                height: 50,
                                width: 50,
                                child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          // return ListView.builder(
          //   itemCount: pokemonData.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(pokemonData[index].name!),
          //       subtitle: Text(pokemonData[index].xdescription!),
          //     );
          //   },
          // );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
