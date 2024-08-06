import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';

import '../utils/utils.dart';

class PokemonDetailsBody extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsBody({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
          ),
          itemCount: pokemon.types.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage(getAssetImage(
                        'pokemon', pokemon.types[index].type.name)),
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    capitalize(pokemon.types[index].type.name),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
