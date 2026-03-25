import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static List<String> mostRecentlyList = [];
  static String mostRecentKey = '';

  static void setLastSura(String newSura) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mostRecentlyList.isEmpty) {
      mostRecentlyList.add('${newSura}');
      prefs.setStringList(SharedPreferenceHelper.mostRecentKey, ['$newSura']);
    }
    prefs.setStringList(SharedPreferenceHelper.mostRecentKey, ['$newSura']);
  }

  static void getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList(SharedPreferenceHelper.mostRecentKey);
  }
}
