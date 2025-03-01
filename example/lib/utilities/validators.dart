class Validators {
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? mobilenumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number is required';
    }
    if (!isNumeric(value) || value.length != 10) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static bool isNumeric(String value) {
    if (value.isEmpty) {
      return false;
    }
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(value);
  }
}
