import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/apis/fytnez/user_route.dart';
import 'package:fytnez_mobile/src/views/components/date_picker_component/date_picker_component.dart';
import 'package:fytnez_mobile/src/views/dialogs/generic_dialogs.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_data.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_validator.dart';

class UserFormPage extends StatefulWidget {
  static const String _routeName = '/user/form';

  static String getRouteName() => _routeName;

  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final UserRoute _userRoute = UserRoute();
  final UserFormData _userFormData = UserFormData();

  void _cancelForm() {
    Navigator.of(context).pop();
  }

  void _confirmForm() async {
    if (UserFormValidator(_userFormData).isValid()) {
      final userDto = _userFormData.toDTO();
      final isCreated = await _userRoute.create(userDto);
      if (isCreated) {
        GenericDialogs.showAlertDialog('Usuário criado com sucesso!',
            onConfirm: () => Navigator.of(context).pop());
      }
    }
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
                                    setState(() => _userFormData.name = value),
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
                                      onChanged: (value) => setState(
                                          () => _userFormData.email = value))),
                            ],
                          ),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                              ),
                              onChanged: (value) => setState(
                                  () => _userFormData.password = value),
                            ))
                          ]),
                          Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Confirmar Senha',
                                ),
                                onChanged: (value) => setState(() =>
                                    _userFormData.passwordConfirmation = value),
                              ))
                            ],
                          ),
                          Row(children: [
                            DatePickerComponent(
                              labelText: 'Data de Nascimento',
                              onSelectDate: (date) =>
                                  setState(() => _userFormData.birthday = date),
                            )
                          ]),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Altura',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) => setState(() =>
                                  _userFormData.height = int.parse(value)),
                            ))
                          ]),
                          Row(children: [
                            Expanded(
                                child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Peso',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) => setState(() =>
                                  _userFormData.weight = int.parse(value)),
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
