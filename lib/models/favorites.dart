import 'package:flutter/material.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.

// ChangeNotifier クラスを継承しており、お気に入りアイテムが変更された場合に通知
class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}