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
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      child: Text(item.favor.nom),
                    ),
                    title: Text(item.favor.motif),
                    subtitle: Text(item.favor.description),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.green.shade800,
                        ),
                        icon: const Icon(Icons.check),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.red.shade800,
                        ),
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
