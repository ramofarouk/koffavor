import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class AcceptationScreen extends StatefulWidget {
  const AcceptationScreen(this.favors, {super.key});

  final List<FavorItem> favors;

  @override
  State<AcceptationScreen> createState() => _AcceptationScreenState();
}

class _AcceptationScreenState extends State<AcceptationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.favors
          .map(
            (item) => Card(
              color: Colors.green[100],
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
