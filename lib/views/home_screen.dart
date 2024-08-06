import 'package:flutter/material.dart';
import 'package:poke_app/providers/providers.dart';
import 'package:poke_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke App'),
      ),
      body: (pokemonProvider.pokemons.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pokemonProvider.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemonProvider.pokemons[index],
                );
              }),
    );
  }
}
