class RedirectHelper {
  static fetchRedirectType(String? value) {
    if (value == null) {
      return null;
    } else if (value.length > 11) {
      return value.substring(2, 11);
    }
  }

  static fetchSecretKey(String? value) {
    if (value != null && value.length > 25) {
      return value.substring(12, value.length);
    }

    return null;
  }
}
