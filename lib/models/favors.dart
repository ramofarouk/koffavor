import 'favor.dart';

class Favors {
  Favors(this._items);

  final List<FavorItem> _items;

  List<FavorItem> get items => _items;

  void add(Favor favor) {
    _items.add(
      FavorItem(
        favor: favor,
        id: _items.isEmpty
            ? 1
            : ((_items..sort((item1, item2) => item1.id.compareTo(item2.id)))
                    .last
                    .id +
                1),
      ),
    );
  }

  void replace(int id, Favor favor) {
    _items.removeWhere((item) => item.id == id);
    _items.add(FavorItem(favor: favor, id: id));
  }
}
