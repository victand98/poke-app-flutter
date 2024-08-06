import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';
import 'package:poke_app/services/services.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonProvider() {
    getInitialData();
  }

  final List<Pokemon> _pokemons = [];
  int pokemonId = 1;

  void getInitialData() async {
    for (int i = 1; i <= 10; i++) {
      final pokemon = await PokemonService.getPokemon(i);
      _pokemons.add(pokemon);
      pokemonId++;
    }

    notifyListeners();
  }

  List<Pokemon> get pokemons => _pokemons;
}
