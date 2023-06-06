import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/apis/fytnez/user_route.dart';
import 'package:fytnez_mobile/src/dtos/user_dto.dart';
import 'package:fytnez_mobile/src/views/components/date_picker_component/date_picker_component.dart';

class UserForm extends StatefulWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final UserRoute _userRoute = UserRoute();

  String _name = '';
  DateTime? _birthday;
  int _height = 0;
  int _weight = 0;
  String _email = '';
  String _password = '';
  String _passwordConfirmation = '';

  void _cancelForm() {}

  void _confirmForm() {
    if (_birthday == null) {
      return;
    }

    if (_password.isEmpty ||
        _passwordConfirmation.isEmpty ||
        _password != _passwordConfirmation) {
      return;
    }

    final userDto = UserDTO(
        name: _name,
        birthday: _birthday!,
        height: _height,
        weight: _weight,
        email: _email,
        password: _password);

    _userRoute.create(userDto);
  }

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
                                  setState(() => _birthday = date),
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