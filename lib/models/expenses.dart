//Class para despesas

class Expenses {
  final int id;
  final int idCategory;
  final String name;
  final double value;
  final String notes;

  const Expenses({
    required this.id,
    required this.idCategory,
    required this.name,
    required this.value,
    required this.notes,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'idCategory': idCategory,
      'name': name,
      'value': value,
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Expenses{id: $id, idCategory: $idCategory, name: $name, value: $value, notes: $notes}';
  }
}
