import 'package:poke_api/model/model_pokemon_list.dart';
import 'package:poke_api/service/service_pokemon_api.dart';

class PokemonRepository {

  final _pokemonApiService = PokemonApiService();

  Future<PokemonListModel> fetchPokemons() =>
      _pokemonApiService.getPokemonList();
}
