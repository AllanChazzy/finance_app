import 'package:finance_app/view/categories_page.dart';
import 'package:finance_app/view/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: LoginMethod(),
      ),
    );
  }
}

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 72,
        ),
        Image.asset('images/background1.png'),
        Image.asset('images/logo.png'),
        const Text(
          'Login',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 32,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'username or e-mail',
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_open),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: 'password',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
          child: Container(
            //LoginButton
            height: 52,
            width: 329,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: Colors.greenAccent,
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'Recuperar senha',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
