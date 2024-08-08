import 'package:poke_app/models/pokemon.dart';

class PokemonCaptures {
  Pokemon pokemon;
  List<String> captures;

  PokemonCaptures({required this.pokemon, this.captures = const []});

  void addCapture(String pathCapture) => captures.add(pathCapture);
}
