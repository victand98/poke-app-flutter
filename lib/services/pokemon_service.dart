import 'package:http/http.dart' as http;
import 'package:poke_app/models/models.dart';

class PokemonService {
  static Future<Pokemon> getPokemon(int id) async {
    final apiUri = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    final response = await http.get(apiUri);
    final pokemon = Pokemon.fromJson(response.body);

    return pokemon;
  }
}
