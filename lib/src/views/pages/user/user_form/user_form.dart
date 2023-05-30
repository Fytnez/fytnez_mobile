import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/components/date_picker_component/date_picker_component.dart';

class UserForm extends StatefulWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String _name = '';
  DateTime? _birthDate;
  int _height = 0;
  int _weight = 0;
  String _email = '';
  String _password = '';
  String _passwordConfirmation = '';

  void _cancelForm() {}

  void _confirmForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Usuário'),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                ),
                                onChanged: (value) =>
                                    setState(() => _name = value),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                      decoration: const InputDecoration(
                                        labelText: 'E-mail',
                                      ),
                                      onChanged: (value) =>
                                          setState(() => _email = value))),
                            ],
                          ),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                              ),
                              onChanged: (value) =>
                                  setState(() => _password = value),
                            ))
                          ]),
                          Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Confirmar Senha',
                                ),
                                onChanged: (value) => setState(
                                    () => _passwordConfirmation = value),
                              ))
                            ],
                          ),
                          Row(children: [
                            DatePickerComponent(
                              labelText: 'Data de Nascimento',
                              onSelectDate: (date) =>
                                  setState(() => _birthDate = date),
                            )
                          ]),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Altura',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  setState(() => _height = int.parse(value)),
                            ))
                          ]),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Peso',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  setState(() => _weight = int.parse(value)),
                            ))
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () => _cancelForm(),
                                  child: const Text('Cancelar')),
                              ElevatedButton(
                                  onPressed: () => _confirmForm(),
                                  child: const Text('Confirmar')),
                            ],
                          ),
                        ],
                      )))),
        ));
  }
}
