import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  Future saveUserData(UserDetails userDetails) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', userDetails.username);
    await preferences.setDouble('level', userDetails.userLevel ?? 0);
  }

  Future<UserDetails> getUserData() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final userLevel = preferences.getDouble('level');

    return UserDetails(username: username ?? '', userLevel: 1.0);
  }
}

//models
class UserDetails {
  final String username;
  final double? userLevel;

  UserDetails({required this.username, this.userLevel});
}
