import 'dart:convert';
import 'package:http/http.dart';

class PokeApi {
  final String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  getNews() async {
    try {
      Response response = await get( // get is a method that is provided by the http package
        Uri.parse(url),  // Uri make sure that you are providing a valid url
        headers: {"Content-Type": "application/json"},  // telling the gateway that data is being sent and received in json format
      );
      var list = jsonDecode(response.body);  // convert from json to list from dart:convert library
      return list;
    } catch (e) {
      print(e);
    }
  }
}
