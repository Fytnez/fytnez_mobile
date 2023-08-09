import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: NetworkImage('https://lh3.googleusercontent.com/w_vIrD8RpJ0hGm5LlqL-6YEfUCuiVujyxpxxIie3MLgRoSeZNfzeavXb2c5Ms6s2s3yn7bxtNIMDHMPmNDYFXYpOPMsfWbHJudQHCXZD'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Peso:'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Altura:'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data de aniversario:'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail:'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Alterar senha:'),
              ),
                
              
            ],
          ),
        ),
      ),
    );
  }
}
