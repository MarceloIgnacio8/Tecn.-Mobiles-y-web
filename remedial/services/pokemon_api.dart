import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';

class PokemonApi {
  static Future<List<PokemonDetails>> fetchPokemonListDetails() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      final List<PokemonDetails> pokemonList = await Future.wait(results.map<Future<PokemonDetails>>((pokemon) async {
        final int id = results.indexOf(pokemon) + 1;
        final String name = pokemon['name'];
        final String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
        final PokemonDetails details = await fetchPokemonDetails(id);
        return PokemonDetails(
          id: id,
          nombre: name,
          imageUrl: imageUrl,
          tipo: details.tipo,
          altura: details.altura,
          peso: details.peso,
        );
      }));
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }

  static Future<PokemonDetails> fetchPokemonDetails(int id) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String name = data['name'];
      final String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
      final String type = data['types'][0]['type']['name']; 
      final double height = data['height'] / 10.0;
      final double weight = data['weight'] / 10.0; 

      return PokemonDetails(
        id: id,
        nombre: name,
        imageUrl: imageUrl,
        tipo: type,
        altura: height,
        peso: weight,
      );
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}