class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidName(String name) {
    if (name.length < 5) {
      return false;
    } else {
      return true;
    }
  //  return name.isEmpty;
  }

  static isValidPhone(String phone) {
    if (phone.length < 12) {
      return false;
    } else {
      return true;
    }
  }
}
