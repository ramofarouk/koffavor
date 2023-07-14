import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/screens/add_favor_screen.dart';

import 'tabs/acceptation_screen.dart';
import 'tabs/refusing_screen.dart';
import 'tabs/waiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Favor> _favors = [];

  @override
  Widget build(BuildContext context) {
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
              bottom: const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white38,
                  tabs: [
                    Tab(
                      text: "En attente",
                    ),
                    Tab(
                      text: "Acceptation",
                    ),
                    Tab(
                      text: "Refus",
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
                WaitingScreen(_favors),
                AcceptationScreen(_favors),
                RefusingScreen(_favors)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () async {
              Favor? favor = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AddFavorScreen();
                  },
                ),
              );

              if (favor != null) {
                _favors.add(favor);
              }
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
