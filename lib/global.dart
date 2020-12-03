String validateEmail(String email) {
  if (email == null || email.isEmpty) return 'Required !!!';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(email)) ? 'Valid Email!!' : null;
}

String validateName(String name) {
  String required = requiredString(name);
  if (required != null) return required;
  Pattern pattern = r'^[ a-zA-Z]*$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(name)) ? 'Valid Name!!' : null;
}

String validatePhone(String phone) {
  String required = requiredString(phone);
  if (required != null) return required;
  Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(phone)) ? 'Valid Phone Number!!' : null;
}

String requiredString(String value) {
  print("dsfdnflkdsf");
  if (value == null || value.isEmpty) return 'Required !!!';
  return null;
}

