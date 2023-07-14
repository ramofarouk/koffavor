import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/providers/favors_notifier.dart';
import 'package:koffavor/screens/add_favor_screen.dart';
import 'package:koffavor/utils/extensions/context.dart';
import 'package:provider/provider.dart';

import 'tabs/acceptation_screen.dart';
import 'tabs/refusing_screen.dart';
import 'tabs/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _goToAddScreen() async {
    context.pushTo<Favor>(const AddFavorScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorsNotifier>(
      builder: (context, favors, child) {
        List<FavorItem> waitingFavors = favors.items
            .where(
              (item) => item.favor.status == FavorStatus.waiting,
            )
            .toList();

        List<FavorItem> rejectedFavors = favors.items
            .where(
              (item) => item.favor.status == FavorStatus.rejected,
            )
            .toList();

        List<FavorItem> acceptedFavors = favors.items
            .where(
              (item) => item.favor.status == FavorStatus.accepted,
            )
            .toList();
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  "KOFFAVOR",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                centerTitle: true,
                bottom: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white38,
                    tabs: [
                      Tab(
                        text: "En attente (${waitingFavors.length})",
                      ),
                      Tab(
                        text: "Acceptés (${acceptedFavors.length})",
                      ),
                      Tab(
                        text: "Refusés (${rejectedFavors.length})",
                      )
                    ]),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)))),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: TabBarView(
                children: [
                  WaitingScreen(waitingFavors),
                  AcceptationScreen(acceptedFavors),
                  RefusingScreen(rejectedFavors),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: _goToAddScreen,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
