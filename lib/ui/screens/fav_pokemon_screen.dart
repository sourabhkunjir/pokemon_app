import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemon.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/repo/hive_repo.dart';

class FavPokemonScreen extends ConsumerStatefulWidget {
  const FavPokemonScreen({super.key});

  @override
  ConsumerState<FavPokemonScreen> createState() => _FavPokemonScreenState();
}

class _FavPokemonScreenState extends ConsumerState<FavPokemonScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      List<Pokemon> pokemonList =
          await ref.read(hiveRepoProvider).getListofPokemonFromHive();
      ref.read(pokemonProvider.notifier).getFavPokemonList(pokemonList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final favPokemonProvider = ref.watch(pokemonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fav Pokemon Screen"),
      ),
      body: favPokemonProvider.isEmpty
          ? const Center(
              child: Text("No favorites currently"),
            )
          : ListView.builder(
              itemCount: favPokemonProvider.length,
              itemBuilder: (context, index) {
                final pokemon = favPokemonProvider[index];
                return ListTile(
                  leading: Image.network(pokemon.imageurl!),
                  title: Text(pokemon.name!),
                  subtitle: Text('ID: ${pokemon.id}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(pokemonProvider.notifier).removePokemon(pokemon);
                    },
                  ),
                );
              },
            ),
    );
  }
}
