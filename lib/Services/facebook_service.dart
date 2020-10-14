import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookService {
  static FacebookService _service;

  FacebookService._instance();

  factory FacebookService() {
    if (_service == null) _service = FacebookService._instance();

    return _service;
  }

  final _facebookLogin = FacebookLogin();

  Future<FacebookLoginResult> login() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        return result;
        break;
      case FacebookLoginStatus.cancelledByUser:
        throw Exception(result.errorMessage);
      case FacebookLoginStatus.error:
        throw Exception(result.errorMessage);
      default:
        throw Exception(result.errorMessage);
    }
  }

  Future<void> logout() async => await _facebookLogin.logOut();
}
