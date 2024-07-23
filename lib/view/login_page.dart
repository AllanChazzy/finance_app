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

class LoginMethod extends StatefulWidget {
  const LoginMethod({super.key});

  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  TextEditingController emailUserController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 72,
        ),
        Image.asset(
            'images/logo.png'), //trocar por um logotipo construído em runtime
        const Text(
          'Login',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _inputField(emailUserController),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _inputField(passwordController, isPassword: true),
        ),
        const SizedBox(
          height: 24,
        ),
        _loginButton(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
            onPressed: null,
            child: Text(
              "Recuperar Senha",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputField(TextEditingController controller, {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        // suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        prefixIcon:
            isPassword ? Icon(Icons.lock_open_outlined) : Icon(Icons.person),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black26)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.lightGreenAccent,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: isPassword ? "Password" : "E-mail or Username",
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginButton() {
    return GestureDetector(
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
        width: 330,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: Colors.lightGreenAccent,
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
    );
  }
}
