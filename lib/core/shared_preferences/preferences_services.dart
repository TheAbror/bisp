import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  Future saveUserData(UserDetails userDetails) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', userDetails.username);

    print('Saved settings');
  }

  Future<UserDetails> getUserData() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');

    return UserDetails(username: username ?? 'User');
  }
}

//models
class UserDetails {
  final String username;

  UserDetails({required this.username});
}
