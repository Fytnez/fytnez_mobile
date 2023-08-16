import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_data.dart'; //

class ProfilePage extends StatelessWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  final UserFormData userFormData; // Pass UserFormData object

  ProfilePage({Key? key, required this.userFormData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 41, 48, 0.95),
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
                  backgroundImage: NetworkImage(
                      'data:image/png;base64,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'),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.76),
                        fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  initialValue: userFormData.name,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Peso:',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.76),
                        fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  initialValue: userFormData.weight.toString(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Altura:',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.76),
                        fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  initialValue: userFormData.height.toString(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Data de aniversário:',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.76),
                        fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  initialValue: userFormData.birthday.toString(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(60, 78, 92, 0.698),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'E-mail:',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.76),
                        fontSize: 16.0),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  initialValue: userFormData.email,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(18, 21, 22, 0.949),
                ),
                child: Text('Alterar senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
