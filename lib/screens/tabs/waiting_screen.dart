import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
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
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  child: Text(favor.nom[0]),
                ),
                title: Text(favor.motif),
                subtitle: Text(favor.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    color: Colors.white,
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.green.shade800,
                    ),
                    icon: const Icon(Icons.check),
                    onPressed: () {},
                  ),
                  IconButton(
                    color: Colors.white,
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red.shade800,
                    ),
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: listFavors.length,
    );
  }
}
