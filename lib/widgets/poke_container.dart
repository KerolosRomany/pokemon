import 'package:flutter/material.dart';
import 'package:live_news/poke_model/poke_model.dart';

class PokeContainer extends StatelessWidget {

  final int index;
  final dynamic data ;
  late PokeModel _poke;

  PokeContainer(this.index, this.data, {Key? key}) : super(key: key){
    _poke = PokeModel(
        data['source'],
        data['title']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blue,width: 1.0),
          boxShadow:const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              blurRadius: 1.0,
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _poke.num,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            _poke.name,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}
