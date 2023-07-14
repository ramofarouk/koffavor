import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class RefusingScreen extends StatefulWidget {
  const RefusingScreen(this.favors, {super.key});

  final List<FavorItem> favors;

  @override
  State<RefusingScreen> createState() => _RefusingScreenState();
}

class _RefusingScreenState extends State<RefusingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.favors
          .map(
            (item) => Card(
              color: Colors.red[100],
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      child: Text(item.favor.nom[0]),
                    ),
                    title: Text(item.favor.motif),
                    subtitle: Text(item.favor.description),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
