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
  int? _categoryType;
  String? _categoryNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categorias",
          style: TextStyle(fontFamily: 'Lexend'),
        ),
        centerTitle: true,
      ),
      body: _categoryList(),
      bottomSheet: _basicButton("Nova Categoria"),
    );
  }

  Widget _categoryList() {
    return FutureBuilder(
      future: _databaseService.getCategories(),
      builder: (context, snapshot) {
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            Category category = snapshot.data![index];
            return ListTile(
                title: Text(
                  category.name,
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  category.notes,
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () {
                    _databaseService.deleteCategory(
                      category.id,
                    );
                    setState(() {});
                  },
                ));
          },
        );
      },
    );
  }

  Widget _formNewCategory() {
    final form = GlobalKey<FormState>();

    final categoryName = TextEditingController();
    final categoryType = TextEditingController();
    final categoryNotes = TextEditingController();

    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "Nome da Categoria",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 12,
              ),
            ),
          ),
          TextFormField(
            controller: categoryName,
            onChanged: (value) {
              setState(() {
                _categoryName = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.label_outline),
              hintText: "e.g. Alimentação, Essenciais, Escola",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightGreenAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "Tipo",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 12,
              ),
            ),
          ),
          TextFormField(
            controller: categoryType,
            onChanged: (value) {
              setState(() {
                _categoryType = int.parse(value);
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.crop_square_rounded),
              hintText: "e.g. Essenciais, Fixas, Livres",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightGreenAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "Notas",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 12,
              ),
            ),
          ),
          TextFormField(
            controller: categoryNotes,
            maxLines: 4,
            maxLength: 64,
            textAlign: TextAlign.start,
            onChanged: (value) {
              setState(() {
                _categoryNotes = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.crop_square_rounded),
              hintText:
                  "e.g. especificações, observações, aplicações, exemplos de utilização",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightGreenAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Cancelar",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                ),
                iconAlignment: IconAlignment.start,
              ),
              FilledButton.icon(
                label: Text(
                  "Salvar",
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  if (_categoryName == null || _categoryName == "") return;
                  _databaseService.addCategory(
                      _categoryName!, _categoryType!, _categoryNotes!);
                  setState(() {
                    _categoryName = null;
                    _categoryType = null;
                    _categoryNotes = null;
                    _categoryList();
                  });
                },
                icon: Icon(Icons.save),
                iconAlignment: IconAlignment.start,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _basicButton(String text) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text(
              "Nova Categoria",
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 24,
                  fontWeight: FontWeight.w100),
            ),
            content: _formNewCategory(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 52,
          width: 330,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34),
            color: Colors.lightGreenAccent,
          ),
          child: Text(
            text,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: 'Lexend',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
