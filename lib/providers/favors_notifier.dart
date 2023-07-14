import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/models/favors.dart';

class FavorsNotifier extends ChangeNotifier {
  final Favors _favors = Favors([]);

  UnmodifiableListView<FavorItem> get items =>
      UnmodifiableListView(_favors.items);

  void add(Favor favor) {
    _favors.add(favor);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void changeStatus(FavorItem item, FavorStatus status) {
    _favors.replace(item.id, item.favor.copyWith(status: status));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
