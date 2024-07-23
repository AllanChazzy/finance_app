import 'package:finance_app/view/categories_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu",
          style: TextStyle(
            fontFamily: 'Lexend',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 72,
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoriesPage(
                              title: 'Categorias',
                            )));
              },
              label: const Text(
                "Categorias",
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                "Despesas",
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                "Receitas",
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(
              height: 72,
            ),
            Image.asset('images/Logo-White.png'),
            const Text(
              "Benance",
              style: TextStyle(
                fontFamily: 'Big Shoulders Display',
                fontSize: 48,
                fontWeight: FontWeight.w800,
                letterSpacing: -2,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.lightGreenAccent,
    );
  }
}
