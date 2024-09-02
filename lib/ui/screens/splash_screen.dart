import 'package:flutter/material.dart';
import 'package:pokemon_app/repo/pokemon_repo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PokemonRepo().getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("this is splash screen"),
        ],
      ),
    );
  }
}
