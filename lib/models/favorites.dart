import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.

// ChangeNotifier クラスを継承しており、お気に入りアイテムが変更された場合に通知
class Favorites extends ChangeNotifier {
  // final List<int> _favoriteItems = [];
  final Map<int, dynamic> _favoriteItems = {};

  /// _favoriteItemsから値を取り出す
  get items => _favoriteItems['item'];
  get meigen => _favoriteItems['meigen'];
  get person => _favoriteItems['person'];

  void add(itemNo) {
    _favoriteItems.addAll(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}

// class Favorites extends ChangeNotifier {
//   final Map<int, dynamic> _favoriteItems = {};

//   /// _favoriteItemsから値を取り出す]
//   int get items => _favoriteItems['itemNo'];
//   String get meigen => _favoriteItems['meigen'] as String;
//   String get person => _favoriteItems['person'] as String;

//   void add(int itemNo) {
//     _favoriteItems.addAll(itemNo);
//     notifyListeners();
//   }

//   void remove(int itemNo) {
//     _favoriteItems.remove(itemNo);
//     notifyListeners();
//   }
// }