class StringHelper {
  static String removeFirstPhraseAndReturn(final String? value) {
    if (value != null) {
      final List<String> phrases = value.split(' ');

      return phrases[0];
    }

    return '';
  }
}
