/* import 'package:flutter/widgets.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/models/favors.dart';

class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final StateContainerState data;

  // You must pass through a child and your state.
  const _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;
  final Favors favors;

  const StateContainer({
    super.key,
    required this.child,
    required this.favors,
  });

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
            as _InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  // Whichever properties you wanna pass around your app as state
  Favors? favors;

  // You can (and probably will) have methods on your StateContainer
  // These methods are then used through our your app to
  // change state.
  // Using setState() here tells Flutter to repaint all the
  // Widgets in the app that rely on the state you've changed.
  void update({
    required int id,
    String? nom,
    String? motif,
    String? description,
    DateTime? creneau,
    FavorStatus? status,
  }) {
    if (favors == null) {
      favors = Favors([]);
      setState(() {});
    }

    FavorItem? item = favors?.items.where((e) => e.id == id).firstOrNull;

    if (item == null) return;

    item.favor.copyWith(
      creneau: creneau,
      description: description,
      motif: motif,
      nom: nom,
      status: status,
    );

    favors?.add(
      Favor(
        nom: nom,
        motif: motif,
        description: description,
        creneau: creneau,
        status: status,
      ),
    );
  }

  void update({
    String? nom,
    String? motif,
    String? description,
    DateTime? creneau,
    FavorStatus? status,
  }) {
    if (favor == null) {
      user = User(firstName, lastName, email);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.firstName = firstName ?? user.firstName;
        user.lastName = lastName ?? user.lastName;
        user.email = email ?? user.email;
      });
    }
  }

  // Simple build method that just passes this state through
  // your InheritedWidget
  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
 */