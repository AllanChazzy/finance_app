class CategoryType {
  final int id;
  final String name;

  const CategoryType({
    required this.id,
    required this.name,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'CategoryType{id: $id, name: $name}';
  }
}
