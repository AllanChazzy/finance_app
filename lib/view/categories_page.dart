import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/database_service.dart';


class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.title});

  final String title;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final DatabaseService _databaseService = DatabaseService.instance;

  String? _categoryName;
  String? _categoryNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _categoryList(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New',
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Nova Categoria"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _categoryName = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _categoryNotes = value;
                        });
                      },
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Notas',
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_categoryName == null ||
                                _categoryName == "") return;
                            _databaseService.addCategory(
                                _categoryName!, _categoryNotes!);
                            setState(() {
                              _categoryName = null;
                              _categoryNotes = null;
                            });
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _categoryList() {
    return FutureBuilder(
      future: _databaseService.getCategories(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            Category category = snapshot.data![index];
            return ListTile(
                onLongPress: () {
                  _databaseService.deleteCategory(
                    category.id,
                  );
                  setState(() {});
                },
                title: Text(category.name),
                subtitle: Text(category.notes),
                trailing: Checkbox(
                  value: category.typeId == 1,
                  onChanged: (value) {
                    _databaseService.updateCategoryTypeId(
                      category.id,
                      value == true ? 1 : 0,
                    );
                    setState(() {});
                  },
                ));
          },
        );
      },
    );
  }
}