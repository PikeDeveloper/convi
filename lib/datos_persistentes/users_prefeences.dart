import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET  decimals
  get decimals {
    return _prefs.getInt('decimals') ?? 2;
  }

  set decimals(int value) {
    _prefs.setInt('decimals', value);
  }

  // GET y SET angle decimals
  get angleDecimals {
    return _prefs.getInt('angleDecimals') ?? 4;
  }

  set angleDecimals(int value) {
    _prefs.setInt('angleDecimals', value);
  }

  // GET y SET result
  get result {
    return _prefs.getInt('result') ?? 4;
  }

  set result(double value) {
    _prefs.setDouble('result', value);
  }
}
