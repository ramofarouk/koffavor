import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class AcceptationScreen extends StatefulWidget {
  const AcceptationScreen(this.favors, {super.key});

  final List<Favor> favors;

  @override
  State<AcceptationScreen> createState() => _AcceptationScreenState();
}

class _AcceptationScreenState extends State<AcceptationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Favor favor = widget.favors[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              child: Text(favor.nom[0]),
            ),
            title: Text(favor.motif),
            subtitle: Text(favor.description),
          ),
        );
      },
      itemCount: widget.favors.length,
    );
  }
}
