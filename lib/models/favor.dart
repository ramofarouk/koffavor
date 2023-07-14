// ignore_for_file: public_member_api_docs, sort_constructors_first
class Favor {
  Favor({
    required this.nom,
    required this.motif,
    required this.description,
    required this.creneau,
    this.status = FavorStatus.waiting,
  });

  final DateTime creneau;
  final String description;
  final String motif;
  final String nom;
  final FavorStatus status;

  Favor copyWith({
    DateTime? creneau,
    String? description,
    String? motif,
    String? nom,
    FavorStatus? status,
  }) {
    return Favor(
      creneau: creneau ?? this.creneau,
      description: description ?? this.description,
      motif: motif ?? this.motif,
      nom: nom ?? this.nom,
      status: status ?? this.status,
    );
  }
}

class FavorItem {
  FavorItem({required this.favor, required this.id});

  final Favor favor;
  final int id;
}

enum FavorStatus {
  waiting(0),

  accepted(1),

  rejected(2);

  final int value;

  const FavorStatus(this.value);
}
