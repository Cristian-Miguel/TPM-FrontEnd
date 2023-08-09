class ValidarCampos {
  static const List<String> patterns = [
    r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])', //* validar Correo
    r"^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$", //* validar Contraseña
    '[0-9]{1,}', //* validar Entero
    '[A-z]{1,}', //* validar Letras,
    '[0-9]{4,}\-([0]{1}[1-9]{1}|[1]{1}[0-2]{1})\-(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})', //* validar Fecha
    '[A-Z]{3,4}[0-9]{2}([0]{1}[1-9]{1}|[1]{1}[0-2]{1})(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})[A-z0-9]{3}' //* validar RFC
  ];

  static validarRegex(value, tipo) {
    final regex = RegExp(patterns[tipo]);
    return value!.isNotEmpty && !regex.hasMatch(value);
  }

  // static validarCorreo(value) {
  //   const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
  //       r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
  //       r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
  //       r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
  //       r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
  //       r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
  //       r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  // }
  // static validarPassword(value) {
  //   const pattern =
  //       '^(?=.*\d)(?=.*[!@#\$%^&*()[\]{}\-_=+;:\'\" |<,>./?`~\\])(?=.*[A-Z])(?=.*[a-z])\S{8,16}\$';
  //   final regex = RegExp(pattern);
  //   return (value.toString().length > 8 && value.toString().length < 16)
  //       ? value!.isNotEmpty && !regex.hasMatch(value)
  //       : false;
  // }
  // static validarNumero(value) {
  //   const pattern = '[0-9]';
  //   final regex = RegExp(pattern);
  //   return value!.isNotEmpty && !regex.hasMatch(value);
  // }
  // static validarLetras(value) {
  //   const pattern = '[A-z]';
  //   final regex = RegExp(pattern);
  //   return value!.isNotEmpty && !regex.hasMatch(value);
  // }
  // static validarFecha(value) {
  //   const pattern =
  //       '(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})\/([0]{1}[1-9]{1}|[1]{1}[0-2]{1})\/[0-9]{4,}';
  //   final regex = RegExp(pattern);
  //   return value!.isNotEmpty && !regex.hasMatch(value);
  // }
  // static validarRFC(value) {
  //   const pattern =
  //       '[A-Z]{3,4}[0-9]{2}([0]{1}[1-9]{1}|[1]{1}[0-2]{1})(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1})[A-z0-9]{3}';
  //   final regex = RegExp(pattern);
  //   return value!.isNotEmpty && !regex.hasMatch(value);
  // }
}
