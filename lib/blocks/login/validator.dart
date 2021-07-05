///Checks if the password and email valid
///@Ece caliskan
///2021

//email that matches the pattern of aaaaaa@aaa.aaaa
//@ and . must be used
class Validators {
  static RegExp _emailCheck = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  //minimum 8 character password at least one number
  static RegExp _passwordCheck = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidEmail(String email) {
    return _emailCheck.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordCheck.hasMatch(password);
  }}



