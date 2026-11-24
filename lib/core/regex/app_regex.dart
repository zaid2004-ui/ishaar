class AppRegex {
  static final RegExp email = RegExp(r'^[\w\-.+]+@([\w\-]+\.)+[\w\-]{2,}$');
  //capetal , symbole and 6 nubmer at least
  static final RegExp password = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*]).{6,}$');
  static final RegExp phone = RegExp(r'^\+?[0-9]{8,15}$');
}
