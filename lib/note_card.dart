// kindacode.com
// main.dart
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  final int? id;
  final String title;
  final String author;

  const NoteCard({
    this.id,
    required this.title,
    required this.author,
    Key? key}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    var card = Center(
      child: Column(
        children: [
          // Text(widget.id),
          Text(widget.title),
          Text(widget.author)
        ],
      ),
    );

    return card;   
  }
}