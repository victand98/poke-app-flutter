import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:poke_app/models/models.dart';
import 'package:poke_app/services/services.dart';
import 'package:poke_app/utils/utils.dart';

class MyPokemonsViewModel extends ChangeNotifier {
  List<PokemonCaptures> pokemonsCaptures = [];
  bool loadingPokemonsCaptures = false;

  MyPokemonsViewModel() {
    loadingPokemonsCaptures = true;

    notifyListeners();
    loadPokemonsCaptures();
  }

  void loadPokemonsCaptures() async {
    try {
      List<String> pokemonsDirs = await FileSystemUtils.listExternalDirectory();

      for (var i = 0; i < pokemonsDirs.length; i++) {
        String pokemonFolderName = basename(pokemonsDirs[i]);

        if (!pokemonFolderName.contains('pokemon_')) return;

        int pokemonId = int.parse(pokemonFolderName.split('_')[1]);
        Pokemon pokemon = await PokemonService.getPokemon(pokemonId);

        List<String> pokemonsCapturePaths =
            await FileSystemUtils.listExternalFolder(pokemonFolderName);

        PokemonCaptures pokemonCaptures =
            PokemonCaptures(pokemon: pokemon, captures: pokemonsCapturePaths);
        pokemonsCaptures.add(pokemonCaptures);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    loadingPokemonsCaptures = false;
    notifyListeners();
  }
}
