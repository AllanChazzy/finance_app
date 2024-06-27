import 'package:finance_app/models/category.dart';
import 'package:finance_app/services/database_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Categories',
      theme: ThemeData(
        fontFamily: 'Lexend',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Categories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseService _databaseService = DatabaseService.instance;

  String? _categoryName;
  String? _categoryNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _categoryList(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New',
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Nova Categoria"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _categoryName = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome',
                          ),
                        ),
                        SizedBox(height: 12),
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
