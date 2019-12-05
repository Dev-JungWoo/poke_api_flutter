import 'package:flutter/material.dart';
import 'package:poke_api/model/model_pokemon_list.dart';

import '../blocs/bloc_pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    pokemonListBloc.getPokemons();

    return StreamBuilder(
        stream: pokemonListBloc.pokemons,
        builder: (context, AsyncSnapshot<PokemonListModel> snapshot) {
          if (snapshot.hasData) {
            return buildListView(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Something wrong!!');
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildListView(PokemonListModel data) {
    return GridView.builder(
        itemCount: data.results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
              child: Card(
                child: Column(
                    children: <Widget>[
                      Text(
                          data.results[index].name,
                          style: TextStyle(fontSize: 20)),
                      //TODO: Load Image here.
                    ]
                ),
              )
          );
        });
  }
}
