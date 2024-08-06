import 'package:flutter/material.dart';
import 'package:poke_app/models/models.dart';
import 'package:poke_app/utils/utils.dart';
import 'package:poke_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(title: Text(capitalize(pokemon.name))),
      body: SingleChildScrollView(
        child: Column(children: [
          PokemonHeader(pokemon: pokemon),
          Text(
            capitalize(pokemon.name),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Weight: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${pokemon.weight} Pounds',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text(
            "Stats: ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          buildStatRow(pokemon.stats)
        ]),
      ),
    );
  }
}

Widget buildStatRow(List<StatElement> stats) {
  return Column(
    children: stats.map((stat) {
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(getAssetImage('stats',
                      stat.stat.name.replaceFirst(RegExp(r'(\-)'), '_'))),
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  capitalize(stat.stat.name),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              stat.baseStat.toString(),
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      );
    }).toList(),
  );
}
