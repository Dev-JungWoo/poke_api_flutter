import 'package:flutter/material.dart';
import 'package:poke_api/model/model_pokemon_list.dart';

import '../blocs/bloc_pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: pokemonListBloc.pokemons,
        builder: (context, AsyncSnapshot<PokemonListModel> snapshot) {
          if (snapshot.hasData) {
            // Show something
            return buildListView(snapshot.data);
          } else if (snapshot.hasError) {
            // Show error
            Text('Something wrong!!');
          }

          return Center(child: CircularProgressIndicator());
        });

//    return ListView.builder(
//        itemCount: pokemonListBloc.pokemons.length,
//        itemBuilder: null
//    );
  }

  Widget buildListView(PokemonListModel data) {
    return GridView.builder(
        itemCount: data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Text(data.results[index].name),
          );
        });
  }
}
