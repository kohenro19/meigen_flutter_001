import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/favorites.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;
  final String meigen;
  final String person;

  const ItemTile(
    this.itemNo,
    this.meigen,
    this.person
  );

  @override
  Widget build(BuildContext context) {
    // Provider.of<Favorites>(context) で親Widgetからデータを受け取る
    var favoritesList = Provider.of<Favorites>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        // leading: CircleAvatar(
        //   backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        // ),
        title: Text(
          '$meigen',
          key: Key('text_$itemNo'),
        ),
        subtitle: Text('$person'),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritesList.items.contains(itemNo)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          onPressed: () {
            !favoritesList.items.contains(itemNo)
                ? favoritesList.add(itemNo)
                : favoritesList.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritesList.items.contains(itemNo)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}