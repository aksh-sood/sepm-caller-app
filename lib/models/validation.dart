class Validation{

  bool validateEmail(var email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validatePhone(var phone) {
    if (phone == null || phone.isEmpty || phone.length != 10) {
      return false;
    }

    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
        .hasMatch(phone);
  }

  bool validatePassword(var password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
    password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > 7;

    return hasDigits &
    hasUppercase &
    hasLowercase &
    hasSpecialCharacters &
    hasMinLength;
  }
}