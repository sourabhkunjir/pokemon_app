import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemon.dart';
import 'package:pokemon_app/repo/hive_repo.dart';
import 'package:pokemon_app/repo/pokemon_repo.dart';

// FutureProvider to fetch the list of Pokémon
final pokemonFutureProvider =
    FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  final pokemonList = await ref.read(pokemonRepoProvider).getPokemonList();
  return pokemonList;
});

// Pokemon StateNotifier class
class PokemonProvider extends StateNotifier<List<Pokemon>> {
  final Ref ref;

  PokemonProvider(this.ref) : super([]);

  // Method to set the favorite Pokémon list
  void getFavPokemonList(List<Pokemon> pokemonList) {
    state = pokemonList;
  }

  // Method to add a Pokémon to the state list
  Future addPokemon(Pokemon pokemon) async {
    await ref.read(hiveRepoProvider).addPokemonToHive(pokemon).then(
      (value) {
        state = [...state, pokemon];
      },
    );
  }

  // Method to remove a Pokémon from the state list
  Future removePokemon(Pokemon pokemon) async {
   await  ref.read(hiveRepoProvider).deletePokemonFromHive(pokemon.id!);
    state = state.where((element) => element.id != pokemon.id).toList();
  }
}

// Provider for the PokemonProvider StateNotifier
final pokemonProvider =
    StateNotifierProvider.autoDispose<PokemonProvider, List<Pokemon>>((ref) {
  return PokemonProvider(ref);
});
