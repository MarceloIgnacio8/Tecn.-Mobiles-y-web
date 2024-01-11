import 'package:flutter/material.dart';
import 'services/pokemon_api.dart';
import 'models/pokemon_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      home: PokemonListPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
          prefixStyle: TextStyle(color: Colors.black),
          suffixStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late Future<List<PokemonDetails>> _pokemonList;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokemonApi.fetchPokemonListDetails();
    _searchController = TextEditingController();
  }

  void _navigateToDetailsPage(PokemonDetails pokemon) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PokemonDetailsPage(pokemon: pokemon),
      ),
    );
  }

  List<PokemonDetails> _filterPokemonList(List<PokemonDetails> pokemonList, String query) {
    return pokemonList.where((pokemon) {
      final lowerCaseQuery = query.toLowerCase();
      return pokemon.nombre.toLowerCase().contains(lowerCaseQuery) ||
          pokemon.tipo.toLowerCase().contains(lowerCaseQuery) ||
          pokemon.id.toString().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imagenes/pokemon_logo.png',
              width: 110,
              height: 110,
            ),
            SizedBox(width: 50),
            Text('Pokédex'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagenes/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Buscar Pokémon',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {}); 
                    },
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); 
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<PokemonDetails>>(
                future: _pokemonList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final filteredList = _filterPokemonList(snapshot.data!, _searchController.text);
                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final pokemon = filteredList[index];
                        return GestureDetector(
                          onTap: () => _navigateToDetailsPage(pokemon),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Hero(
                                tag: 'pokemon-image-${pokemon.id}',
                                child: Image.network(
                                  pokemon.imageUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                pokemon.nombre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text('ID: ${pokemon.id}'),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonDetailsPage extends StatelessWidget {
  final PokemonDetails pokemon;

  PokemonDetailsPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nombre),
      ),
      body: Container(
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'pokemon-image-${pokemon.id}',
                child: Image.network(
                  pokemon.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text('ID: ${pokemon.id}'),
              Text('Nombre: ${pokemon.nombre}'),
              Text('Tipo: ${pokemon.tipo}'),
              Text('Altura: ${pokemon.altura} m'),
              Text('Peso: ${pokemon.peso} kg'),
            ],
          ),
        ),
      ),
    );
  }
}
