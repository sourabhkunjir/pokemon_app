import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/data/models/pokemon.dart';
import 'package:pokemon_app/data/networking/api_endpoints.dart';
import 'package:pokemon_app/data/networking/dio_client.dart';

class PokemonRepo {
  final DioClient _dioClient = DioClient();

  Future<List<Pokemon>> getPokemonList() async {
    final response = await _dioClient.get(APIEndpoints.baseUrl);
    if (response.statusCode == 200) {
      log(response.data.toString());
      final List<Pokemon> pokemonList = [];
      final decodedData = jsonDecode(response.data);
      log(decodedData.toString());
      
      decodedData.forEach((pokemon) {
        pokemonList.add(Pokemon.fromJson(pokemon));
      });
      log(pokemonList.length.toString());
      return pokemonList;
    } else {
      log("Failed to fetch pokemon list");
      throw Exception("Failed to fetch pokemon list");
    }
  }
}

final pokemonRepoProvider = Provider<PokemonRepo>((ref) => PokemonRepo());
