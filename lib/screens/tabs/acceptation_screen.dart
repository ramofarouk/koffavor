import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class AcceptationScreen extends StatefulWidget {
  const AcceptationScreen({super.key});

  @override
  State<AcceptationScreen> createState() => _AcceptationScreenState();
}

class _AcceptationScreenState extends State<AcceptationScreen> {
  List<Favor> listFavors = [];

  @override
  void initState() {
    listFavors.add(Favor(
        creneau: DateTime.now(),
        description:
            'J\'ai besoin urgemment d\'argent pour des raisons de santé.',
        motif: 'Besoin d\'argent',
        nom: 'Omar',
        status: 1));
    listFavors.add(Favor(
        creneau: DateTime.now(),
        description:
            'Je prépare un exam et je veux que tu me passes ton ebook sur PHP.',
        motif: 'Prêt de document',
        nom: 'Farouk',
        status: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Favor favor = listFavors[index];
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
      itemCount: listFavors.length,
    );
  }
}
