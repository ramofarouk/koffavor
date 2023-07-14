import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/providers/favors_notifier.dart';
import 'package:provider/provider.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen(this.favors, {super.key});

  final List<FavorItem> favors;

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorsNotifier>(builder: (context, favors, child) {
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
                        child: Text(item.favor.nom[0]),
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
                          onPressed: () {
                            favors.changeStatus(item, FavorStatus.accepted);
                          },
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
                          onPressed: () {
                            favors.changeStatus(item, FavorStatus.rejected);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
            .toList(),
      );
    });
  }
}
