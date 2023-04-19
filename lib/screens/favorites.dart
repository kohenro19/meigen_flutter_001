import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      // Consumer: notifyされた際、再ビルドの対象を絞るためのWidget
      // お気に入りリストのデータを提供し、そのデータが変更された場合にビルドを再実行するようにします。
      // この場合、お気に入りリストはFavoritesモデルのインスタンスです。
      // BuildContext context：現在のウィジェットのビルドコンテキストを表します。
      // context: 現在のウィジェットのビルドコンテキストを表す
      // value: Providerから提供されたデータ。この場合、Favoritesモデルのインスタンス
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavoriteItemTile(value.items[index], value.meigen[index], value.person[index]),
        ),
      ),
    );
  }
}

// class FavoriteItemTile extends StatelessWidget {
//   final int itemNo;

//   const FavoriteItemTile(
//     this.itemNo,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
//         ),
//         title: Text(
//           'Item $itemNo',
//           key: Key('favorites_text_$itemNo'),
//         ),
//         trailing: IconButton(
//           key: Key('remove_icon_$itemNo'),
//           icon: Icon(Icons.close),
//           onPressed: () {
//             // 親Widgetで Provider<Favorites>.value() を使いデータを渡す
//             Provider.of<Favorites>(context, listen: false).remove(itemNo);
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Removed from favorites.'),
//                 duration: Duration(seconds: 1),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


class FavoriteItemTile extends StatelessWidget {
  final int itemNo;
  final String meigen;
  final String person;

  const FavoriteItemTile(
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