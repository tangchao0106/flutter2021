/// buttons : {"login":"Login","sign_in":"Sign-in","logout":"Logout","sign_in_fb":"Sign-in with Facebook","sign_in_google":"Sign-in with Google","sign_in_apple":"Sign-in with Apple"}

class Demobean {
  Demobean({
      Buttons? buttons,}){
    _buttons = buttons;
}

  Demobean.fromJson(dynamic json) {
    _buttons = json['buttons'] != null ? Buttons.fromJson(json['buttons']) : null;
  }
  Buttons? _buttons;

  Buttons? get buttons => _buttons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_buttons != null) {
      map['buttons'] = _buttons?.toJson();
    }
    return map;
  }

}

/// login : "Login"
/// sign_in : "Sign-in"
/// logout : "Logout"
/// sign_in_fb : "Sign-in with Facebook"
/// sign_in_google : "Sign-in with Google"
/// sign_in_apple : "Sign-in with Apple"

class Buttons {
  Buttons({
      String? login, 
      String? signIn, 
      String? logout, 
      String? signInFb, 
      String? signInGoogle, 
      String? signInApple,}){
    _login = login;
    _signIn = signIn;
    _logout = logout;
    _signInFb = signInFb;
    _signInGoogle = signInGoogle;
    _signInApple = signInApple;
}

  Buttons.fromJson(dynamic json) {
    _login = json['login'];
    _signIn = json['sign_in'];
    _logout = json['logout'];
    _signInFb = json['sign_in_fb'];
    _signInGoogle = json['sign_in_google'];
    _signInApple = json['sign_in_apple'];
  }
  String? _login;
  String? _signIn;
  String? _logout;
  String? _signInFb;
  String? _signInGoogle;
  String? _signInApple;

  String? get login => _login;
  String? get signIn => _signIn;
  String? get logout => _logout;
  String? get signInFb => _signInFb;
  String? get signInGoogle => _signInGoogle;
  String? get signInApple => _signInApple;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['sign_in'] = _signIn;
    map['logout'] = _logout;
    map['sign_in_fb'] = _signInFb;
    map['sign_in_google'] = _signInGoogle;
    map['sign_in_apple'] = _signInApple;
    return map;
  }

}