import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';
import 'package:poke_app/utils/utils.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: Image.network(pokemon.sprites.frontDefault, scale: 1.5),
          title: Text(
            capitalize(pokemon.name),
            style: const TextStyle(fontSize: 40),
          ),
          subtitle: Text(
            capitalize(pokemon.types[0].type.name),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
