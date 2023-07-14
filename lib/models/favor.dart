// ignore_for_file: public_member_api_docs, sort_constructors_first
class Favor {
  Favor({
    required this.nom,
    required this.motif,
    required this.description,
    required this.creneau,
    required this.status,
  });

  final DateTime creneau;
  final String description;
  final String motif;
  final String nom;
  final int status;
}
