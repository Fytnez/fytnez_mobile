import 'package:fytnez_mobile/src/exceptions/validation_exception.dart';
import 'package:fytnez_mobile/src/views/dialogs/generic_dialogs.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_data.dart';

class UserFormValidator {
  final UserFormData _userFormData;

  UserFormValidator(this._userFormData);

  void _validateBirthday() {
    if (_userFormData.birthday == null) {
      throw ValidationException('Data de nascimento inválida');
    }
  }

  void _validatePassword() {
    if (_userFormData.password.isEmpty ||
        _userFormData.passwordConfirmation.isEmpty) {
      throw ValidationException('Preencha as senhas!');
    }

    if (_userFormData.password != _userFormData.passwordConfirmation) {
      throw ValidationException('Senhas diferentes!');
    }
  }

  bool isValid() {
    try {
      _validateBirthday();
      _validatePassword();
      return true;
    } on ValidationException catch (e) {
      GenericDialogs.showAlertDialog(e.toString());
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
