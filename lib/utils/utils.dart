String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

String getAssetImage(String type, String name) {
  return 'assets/img/${type}_types/$name.png';
}
