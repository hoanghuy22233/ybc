class AppValidation {
  static validateFullName(String result) {
    return (value) {
      if (value == null || value.length == 0) {
        return result;
      }
      return null;
    };
  }

  static validateUserName(String result) {
    return (value) {
      if (value == null || value.length < 6 ) {
        return result;
      } else {
        Pattern patternPhone = r'^(?:[+0]9)?[0-9]{10}$';
        RegExp regexPhone = new RegExp(patternPhone);
        Pattern patternEmail =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regexEmail = new RegExp(patternEmail);
        if (!regexEmail.hasMatch(value) && !regexPhone.hasMatch(value))
          return result;
        else
          return null;
      }
    };
  }

  static validateEmail(String result) {
    return (value) {
      if (value == null || value.length == 0) {
        return result;
      } else {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return result;
        else
          return null;
      }
    };
  }

  static validatePhoneNumber(String result) {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);

    return (value) {
      if (value == null || value.length == 0) {
        return result;
      } else if (value.length != 10) {
        return result;
      } else if (!regex.hasMatch(value)) {
        return result;
      } else {
        return null;
      }
    };
  }

  static validatePassword(String result) {
    return (value) {
      if (value == null || value.length < 6) {
        return result;
      }
      return null;
    };
  }

  static validateOTP(String result) {
    return (value) {
      if (value == null || value.length < 4 || value.length > 4) {
        return result;
      }
      return null;
    };
  }

  static validateCMND(String result) {
    return (value) {
      if (value == null || value.length == 0) {
        return result;
      }
      return null;
    };
  }

  static validateAddress(String result) {
    return (value) {
      if (value == null || value.length == 0) {
        return result;
      }
      return null;
    };
  }
}
