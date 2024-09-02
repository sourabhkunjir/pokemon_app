import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/ui/screens/all_pokemon_screen.dart';

void main() {
  runApp(ProviderScope(child: const PokemanApp()));
}

class PokemanApp extends StatelessWidget {
  const PokemanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllPokemonScreen(),
    );
  }
}
