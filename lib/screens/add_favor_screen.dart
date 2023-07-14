import 'package:flutter/material.dart';
import 'package:koffavor/models/favor.dart';

class AddFavorScreen extends StatefulWidget {
  const AddFavorScreen({super.key});

  @override
  State<AddFavorScreen> createState() => _AddFavorScreenState();
}

class _AddFavorScreenState extends State<AddFavorScreen> {
  String nom = '';
  TextEditingController motif = TextEditingController();
  TextEditingController description = TextEditingController();
  DateTime creneau = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          "Ajouter une faveur",
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 6,
              foregroundColor: Colors.white),
          onPressed: () {
            Favor favor = Favor(
              nom: nom,
              motif: motif.text,
              description: description.text,
              creneau: creneau,
              status: 0,
            );

            Navigator.pop(context, favor);
          },
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("VALIDER"), Icon(Icons.add)]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Choisir un ami"),
              items: ["Omar", "Farouk"]
                  .map((String e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    nom = value;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: motif,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Taper le motif"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: description,
              maxLines: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Taper la description"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: TextEditingController(
                text: creneau.toString(),
              ),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2050, 12, 31),
                );

                debugPrint(date.toString());

                if (date != null) {
                  setState(() {
                    creneau = date;
                  });
                }
              },
              readOnly: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Choisir une date"),
            ),
          ],
        ),
      ),
    );
  }
}
