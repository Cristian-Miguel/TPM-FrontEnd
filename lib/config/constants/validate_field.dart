class ValidateField {
  static validateRegex(value, RegexField regexfield) {
    final regex = RegExp(regexfield.regex);
    return value!.isNotEmpty && !regex.hasMatch(value);
  }

  static printError(validation) {
    for (var i = 0; i < validation.length; i++) {
      if (validation[i][0]) return validation[i][1];
    }
    return null;
  }
}

enum RegexField {
  email(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'),
  password(
      r"^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$"),
  integer('[0-9]{1,}'),
  letters('[A-z]{1,}'),
  date(
      '[0-9]{4,}-([0]{1}[1-9]{1}|[1]{1}[0-2]{1})-(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})'),
  rfc('[A-Z]{3,4}[0-9]{2}([0]{1}[1-9]{1}|[1]{1}[0-2]{1})(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})[A-z0-9]{3}');

  final String regex;

  const RegexField(this.regex);
}
