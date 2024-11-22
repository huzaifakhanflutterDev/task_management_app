class MyValidator {
  static String? forName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name must not be empty';
    } else if (value.length < 4) {
      return 'Name must be at least 4 characters';
    }
    return null;
  }

  static String? forEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(value)) {
      return "Please Enter a valid Email";
    }
    return null;
  }

  static String? forPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (value.length < 6) {
      return '';
    }
    return null;
  }

// static String? validateConfirmPassword(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter your password';
//   }
//   if (value.length < 6) {
//     return 'Password must be at least 6 characters long';
//   }
//   if (validatorController.confirmPassController.value != validatorController.passwordController.value) {
//     return "Passwords Doesn't match";
//   } else {
//     return null;
//   }
// }
}
