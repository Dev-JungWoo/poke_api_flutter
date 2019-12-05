import 'package:poke_api/model/model_pokemon_list_item.dart';

class PokemonListModel {
  final int _count;
  final String _next;
  final String _previous;
  final List<PokemonListItemModel> _results;

  PokemonListModel(this._count, this._next, this._previous, this._results);

  int get count => _count;

  String get next => _next;

  String get previous => _previous;

  List<PokemonListItemModel> get results => _results;

  PokemonListModel.fromJson(Map<String, dynamic> json)
      : _count = json['count'],
        _next = json['next'],
        _previous = json['previous'],
        _results = (json['results'] as List)
            .map((resultsJson) => PokemonListItemModel.fromJson(resultsJson))
            .toList();

  Map<String, dynamic> toJson() => {
        'count': _count,
        'next': _next,
        'previous': _previous,
        'results': _results
      };
}
