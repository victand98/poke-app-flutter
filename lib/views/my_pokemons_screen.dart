import 'package:flutter/material.dart';
import 'package:poke_app/view_models/view_models.dart';
import 'package:poke_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyPokemonsScreen extends StatefulWidget {
  const MyPokemonsScreen({super.key});

  @override
  State<MyPokemonsScreen> createState() => _MyPokemonsScreenState();
}

class _MyPokemonsScreenState extends State<MyPokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pokemons'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyPokemonsViewModel()),
        ],
        child: const MyPokemonsBody(),
      ),
    );
  }
}
