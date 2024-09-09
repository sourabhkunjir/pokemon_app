import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/repo/hive_repo.dart';
import 'package:pokemon_app/themes/theme.dart';
import 'package:pokemon_app/themes/theme_provider.dart';
import 'package:pokemon_app/ui/screens/all_pokemon_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveRepo hiveRepo = HiveRepo();
  await hiveRepo.initHive();
  runApp(ProviderScope(child: const PokemanApp()));
}

class PokemanApp extends ConsumerWidget {
  const PokemanApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);
    return MaterialApp(
      theme: Styles.themeData(themeNotifier, context),
      home: AllPokemonScreen(),
    );
  }
}
