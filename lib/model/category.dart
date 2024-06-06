class Category {
  final int id;
  final int typeId;
  final String name;
  final String notes;

  const Category({
    required this.id,
    required this.typeId,
    required this.name,
    required this.notes,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'typeId': typeId,
      'name': name,
      'notes': notes,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, typeId: $typeId, name: $name, notes: $notes}';
  }
}
