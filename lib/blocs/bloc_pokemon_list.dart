import 'package:poke_api/model/model_pokemon_list.dart';
import 'package:poke_api/repository/repository_pokemon.dart';
import 'package:rxdart/rxdart.dart';

class PokemonListBloc {
  final _repository = PokemonRepository();
  final _pokemonsFetcher = PublishSubject<PokemonListModel>();

  Observable<PokemonListModel> get pokemons => _pokemonsFetcher.stream;

  getPokemons() async {
    PokemonListModel pokemonList = await _repository.fetchPokemons();
    _pokemonsFetcher.add(pokemonList);
  }

  dispose() {
    _pokemonsFetcher.close();
  }
}

final pokemonListBloc = PokemonListBloc();

