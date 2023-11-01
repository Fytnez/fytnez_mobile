import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/apis/fytnez/user_route.dart';
import 'home_page.dart';
import 'user/user_form/user_form_page.dart';


class Login extends StatefulWidget {
  static const String _routeName = '/login';

  static String getRouteName() => _routeName;

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserRoute _userRoute = UserRoute();
  String _email = '';
  String _password = '';

  Future<void> autheticate() async {
    if (_email.isEmpty || _password.isEmpty) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 41, 48, 0.95),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Fytnez',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(208, 240, 247, 1),
                ),
              ),
            ),
            const SizedBox(height: 64),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(60, 78, 92, 0.698),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                initialValue: _email,
                onChanged: (value) => setState(() => _email = value),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.76),
                      fontSize: 16.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(60, 78, 92, 0.698),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                initialValue: _password,
                onChanged: (value) => setState(() => _password = value),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.76),
                      fontSize: 16.0),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Home.getRouteName());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: const Color.fromRGBO(208, 240, 247, 0.95),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 0,
                  visualDensity: VisualDensity.compact,
                ),
                child: const Text('Acessar'),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  "Novo aqui? Cadastre-se",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, UserFormPage.getRouteName());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
