import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen(this.favors, {super.key});

  final List<Favor> favors;

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Favor favor = widget.favors[index];
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
      itemCount: widget.favors.length,
    );
  }
}
