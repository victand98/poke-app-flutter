export 'package:poke_app/utils/file_system_utils.dart';
export 'package:poke_app/utils/permission_utils.dart';

String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

String getAssetImage(String type, String name) {
  return 'assets/img/${type}_types/$name.png';
}
