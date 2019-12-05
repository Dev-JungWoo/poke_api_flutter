
class PokemonListItemModel {
  final String name;
  final String url;

  PokemonListItemModel(this.name, this.url);

  PokemonListItemModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
