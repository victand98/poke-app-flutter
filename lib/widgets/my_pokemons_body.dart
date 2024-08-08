import 'package:flutter/material.dart';
import 'package:poke_app/view_models/view_models.dart';
import 'package:poke_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyPokemonsBody extends StatefulWidget {
  const MyPokemonsBody({super.key});

  @override
  State<MyPokemonsBody> createState() => _MyPokemonsBodyState();
}

class _MyPokemonsBodyState extends State<MyPokemonsBody> {
  late MyPokemonsViewModel myPokemonsViewModel;

  @override
  Widget build(BuildContext context) {
    myPokemonsViewModel = Provider.of<MyPokemonsViewModel>(context);

    return myPokemonsViewModel.loadingPokemonsCaptures
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myPokemonsViewModel.pokemonsCaptures.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(
                      pokemon:
                          myPokemonsViewModel.pokemonsCaptures[index].pokemon,
                      captures:
                          myPokemonsViewModel.pokemonsCaptures[index].captures,
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
  }
}
