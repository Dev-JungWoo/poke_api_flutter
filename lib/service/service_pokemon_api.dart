
import 'dart:convert';

import 'package:http/http.dart';
import 'package:poke_api/model/model_pokemon_list.dart';

class PokemonApiService {

  Future<PokemonListModel> getPokemonList() async {
    String url = 'https://pokeapi.co/api/v2/pokemon';
    Response response = await get(url);

    int statusCode = response.statusCode;
    String jsonString = response.body;

    Map pokeListJson = jsonDecode(jsonString);

    PokemonListModel list = PokemonListModel.fromJson(pokeListJson);

    print('Count = ${list.count}');

    return list;
  }
}