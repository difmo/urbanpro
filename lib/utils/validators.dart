class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegx =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value.contains('..') ||
        value.contains(' @') ||
        value.contains('@ ') ||
        value.contains('.@') ||
        value.contains('@.') ||
        value.contains('-@') ||
        value.contains('@-')) {
      return 'Enter a valid email';
    }
    // test
    if (!emailRegx.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    value = value.trim();
    if (value.length <= 7) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  static String? validateCPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    value = value.trim();
    if (value.length <= 7) {
      return 'Confirm Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Confirm Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Confirm Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Confirm Password must contain at least one number';
    }
    return null;
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account Number is required';
    }
    if (value.length < 2) {
      return 'Account Number must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePaymentGatewayId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'ID is required';
    }
    if (value.trim().length < 2) {
      return 'ID must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'ID can only contain letters and numbers';
    }
    return null;
  }

  static String? validateRequiredField(String? value, String? fieldName) {
    if (value == null) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateRequiredFieldOnly(String? value) {
    if (value == null) {
      return 'Field is required';
    }
    return null;
  }

  static String? testingField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  static String? validateZipCode(String? value) {
    final zipRegEx = RegExp(r'^\d{6}$');
    if (value!.isNotEmpty && !zipRegEx.hasMatch(value)) {
      return 'Pincode must be exactly 6 digits';
    }
    return null;
  }

  static String? checkLength(String? value) {
    if (value!.isNotEmpty && value.length <= 2) {
      return '$value must be at least 2 characters long';
    }
    return null;
  }

  String? checkLengthAndRequired(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label must not be empty';
    }
    if (value.isNotEmpty && value.length <= 2) {
      return '$label must be at least 2 characters long';
    }
    if (value.length > 50) {
      return '$label must not exceed 50 characters';
    }
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (specialCharRegex.hasMatch(value)) {
      return '$label must not contain special characters';
    }
    return null; // No error, input is valid
  }

  String? checkLengthAndAddress(String? value, String label) {
    if (value!.isNotEmpty && value.length <= 2) {
      return '$label must be at least 2 characters long';
    }
    if (value.length > 50) {
      return '$label must not exceed 50 characters';
    }
    return null; // No error, input is valid
  }

  String? checkLengths(String? value, String label) {
    if (value!.isNotEmpty && value.length <= 2) {
      return '$label must be at least 2 characters long';
    }
    if (value.length > 50) {
      return '$label must not exceed 50 characters';
    }
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (specialCharRegex.hasMatch(value)) {
      return '$label must not contain special characters';
    }

    return null; // No error, input is valid
  }

  static String? validateCity(String? value) {
    return checkLength(value);
  }

  static String? validateState(String? value) {
    return checkLength(value);
  }

  static String? validateCountry(String? value) {
    return checkLength(value);
  }

  static String? validateAddress(String? value, String fieldName) {
    return checkLength(value);
  }

  static String? validateDob(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label must not be empty';
    }

    // Regular expression for MM/DD/YYYY format
    final dobRegEx =
        RegExp(r'^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/\d{4}$');

    // Check if the value matches the regex
    if (!dobRegEx.hasMatch(value)) {
      return 'Enter a valid date (MM/DD/YYYY)';
    }

    // Further validation to ensure it's a real date
    try {
      final parts = value.split('/');
      final month = int.parse(parts[0]);
      final day = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final date = DateTime(year, month, day);

      // Ensure that the parsed date is exactly the same as the input
      if (date.month != month || date.day != day || date.year != year) {
        return 'Enter a valid date (MM/DD/YYYY)';
      }
    } catch (e) {
      return 'Enter a valid date (MM/DD/YYYY)';
    }

    return null; // Date is valid
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegEx = RegExp(r'^\d{10}$');
    if (!phoneRegEx.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }
}
