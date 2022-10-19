import 'package:flutter/material.dart';
import 'note_card.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  List<Color> colorList = [Colors.cyan, Colors.deepOrange, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
 
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: colorList[index % colorList.length],
            child: NoteCard(
              title: "Happy wife",
              author: "keita",
            ),
          );
        },
      )
    );
  }
}