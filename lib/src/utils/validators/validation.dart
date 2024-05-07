class Validator {
  ///Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    // regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email Adress.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // check for uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // check for nummbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    //check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*()<>,.?:|{};]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword){
    if (confirmPassword == null || confirmPassword.isEmpty){
      return 'Confirm password is required';
    }

    if(password != confirmPassword){
      return 'Passwords do not match.';
    }
    return null;
  }
}
