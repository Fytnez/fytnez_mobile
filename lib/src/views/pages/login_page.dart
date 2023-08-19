import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String _routeName = 'Login';


  static String getRouteName() => _routeName;

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(32, 41, 48, 0.95),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
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
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:TextStyle(color: Color.fromRGBO(255, 255, 255, 0.76), fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.76), fontSize: 16.0),
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
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  child: const Text('Acessar'),             
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(208, 240, 247, 0.95),
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    "Novo aqui? Cadastre-se",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
    );
  }
}
