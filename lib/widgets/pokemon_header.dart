import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';

class PokemonHeader extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: Image(
              image: NetworkImage(pokemon.sprites.frontDefault),
              fit: BoxFit.cover,
              height: 160,
              width: 180,
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.camera_alt_rounded),
                color: Colors.white,
                iconSize: 50,
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
