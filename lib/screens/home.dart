import 'dart:async';
import 'package:flutter/material.dart';
import '../poke_model/poke_api.dart';
import '../widgets/poke_container.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late StreamController _streamController;
  late Stream _stream;
  late PokeApi _pokeApi;

  @override
  void initState() {
    super.initState();
    _streamController= StreamController();
    _stream = _streamController.stream;
    _pokeApi= PokeApi();
    getNews();

  }

  getNews()async{
    var response = await _pokeApi.getNews();
    _streamController.add(response);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Poke App',),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu),onPressed: (){}),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.refresh),
        ),

        body: Center(
          child: StreamBuilder(
            stream: _stream,
              builder: (context,snapshot){
                if(snapshot.hasData) {
                  var myData = snapshot.data as Map;
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) =>
                        PokeContainer(
                          i,
                          myData['pokemon'][i],
                        ),
                  );
                }
                return const CircularProgressIndicator();
              }
          ),
        ),
      ),
    );
  }
}


