import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MeigenCard extends StatefulWidget {
  
  final int? id;
  final String meigen;
  final String author;
  final String categroy;

  
  const MeigenCard(
    {
      required this.id,
      required this.meigen,
      required this.author,
      required this.categroy,
      Key? key}) : super(key: key);

  @override
  State<MeigenCard> createState() => _MeigenCardState();
}

class _MeigenCardState extends State<MeigenCard> {
  @override
  Widget build(BuildContext context) {
      var card = Card(
        child: GestureDetector(
          child: Row(
            children: [
              Text("data"),
              Text("ddd")      
            ],
          ),
        ),
      );
      
      return card;
 
  }
}