import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokemon_app/data/models/pokemon.dart';

class HiveRepo {
  //register adapter
  final pokemonBoxName = "pokemonBox";
  Future initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PokemonAdapter());
  }

  //add to hive
  Future addPokemonToHive(Pokemon pokemon) async {
    final box = await Hive.openBox(pokemonBoxName);
    if (box.isOpen) {
      await box.put(pokemon.id!, pokemon).then(
        (value) {
          log("pokemon added to hive");
        },
      );
    } else {
           log("Failed to add pokemon to hive");
      return;
    }
  }

  //get from hive
  Future<List<Pokemon>> getListofPokemonFromHive() async {
    final box = await Hive.openBox(pokemonBoxName);
    if (box.isOpen) {
      return box.values.toList().cast<Pokemon>();
    } else {
      return [];
    }
  }

  //delete from hive
  Future deletePokemonFromHive(String id) async {
    final box = await Hive.openBox(pokemonBoxName);
    if (box.isOpen) {
      box.delete(id);
    } else {
      return;
    }
  }
}

final hiveRepoProvider = Provider<HiveRepo>(
  (ref) => HiveRepo(),
);
