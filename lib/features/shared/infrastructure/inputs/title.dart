import 'package:formz/formz.dart';

enum TitleError { empty, length }

class Title extends FormzInput<String, TitleError> {
  const Title.pure() : super.pure('');

  const Title.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TitleError.empty) return 'El campo es requerido';

    if (displayError == TitleError.length) {
      return 'El campo debe ser mayor a dos caracteres';
    }

    return null;
  }

  @override
  TitleError? validator(String value) {
    if (value.isEmpty) return TitleError.empty;
    if (value.length < 2) return TitleError.length;

    return null;
  }

}
