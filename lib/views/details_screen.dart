import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: const Text('Details Screen'),
    );
  }
}
