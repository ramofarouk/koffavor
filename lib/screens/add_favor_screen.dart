import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koffavor/models/favor.dart';
import 'package:koffavor/utils/extensions/context.dart';

class AddFavorScreen extends StatefulWidget {
  const AddFavorScreen({super.key});

  @override
  State<AddFavorScreen> createState() => _AddFavorScreenState();
}

class _AddFavorScreenState extends State<AddFavorScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  final TextEditingController _motifController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _creneau = DateTime.now();

  bool _saving = false;

  Future<void> _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _saving = true;
      });

      Favor favor = Favor(
        nom: _nom,
        motif: _motifController.text,
        description: _descriptionController.text,
        creneau: _creneau,
      );

      //Wait 5 seconds
      await Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _saving = false;
        });
      });

      if (context.mounted) {
        context.pop(favor);
      }
    }
  }

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
        child: _saving
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 6,
                  foregroundColor: Colors.white,
                ),
                onPressed: _save,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("VALIDER"),
                    Icon(Icons.add),
                  ],
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Choisir un ami",
                ),
                items: ["Omar", "Farouk"]
                    .map((String e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  if (value == null) return;

                  _nom = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _motifController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Taper le motif",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Taper la description",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TextEditingController(
                  //text: DateFormat("yyyy/MM/dd").format(_creneau),
                  text: DateFormat("EEE, d MMMM, yyyy").format(_creneau),
                ),
                onTap: () async {
                  DateTime? date = (await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2050, 12, 31),
                  ));

                  if (date == null) return;

                  _creneau = date;
                },
                readOnly: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Choisir une date",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
