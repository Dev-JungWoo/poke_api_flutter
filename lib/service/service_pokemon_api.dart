import 'dart:convert';

import 'package:http/http.dart';
import 'package:poke_api/model/model_pokemon_list.dart';

class PokemonApiService {

  Future<PokemonListModel> getPokemonList() async {
    String url = 'https://pokeapi.co/api/v2/pokemon';
    Response response = await get(url);

    int statusCode = response.statusCode;

    if (200 <= statusCode && statusCode < 300) {
      PokemonListModel list =
          PokemonListModel.fromJson(jsonDecode(response.body));
      return list;
    }

    throw Exception('Failed to load post');
  }
}
