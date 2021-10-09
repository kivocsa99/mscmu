import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _yearIdKey = 'yearId';
const _yearNamekey = "yearName";
const _yearId2Key = 'yearId2';
const _isWelcomeKey = 'iswelcome';
const _isclinicalkey = 'isclinical';

class PrefChangeNotifier with ChangeNotifier {
  late final SharedPreferences _sharedPreferences;

  PrefChangeNotifier(this._sharedPreferences) {
    getPref();
  }

  int? _yearId;
  int? _yearId2;
  bool? _iswelcome;
  bool? _isclinical;

  String? _yearName;

  String get yearName => _yearName!;
  int get yearId => _yearId!;
  int get yearId2 => _yearId2!;
  bool get iswelcome => _iswelcome!;
  bool get isclinical => _isclinical!;

  void getPref() async {
    _yearId = _sharedPreferences.getInt(_yearIdKey);
    _yearId2 = _sharedPreferences.getInt(_yearId2Key);
    _iswelcome = _sharedPreferences.getBool(_isWelcomeKey);
    _yearName = _sharedPreferences.getString(_yearNamekey);
    _isclinical = _sharedPreferences.getBool(_isclinicalkey);
    notifyListeners();
  }

  void setYearId(int yearId) async {
    await _sharedPreferences.setInt(_yearIdKey, yearId);
    _yearId = yearId;
    notifyListeners();
  }

  void setYearId2(int yearId) async {
    await _sharedPreferences.setInt(_yearId2Key, yearId);
    _yearId2 = yearId;
    notifyListeners();
  }

  void setYearName(String yearname) async {
    await _sharedPreferences.setString(_yearNamekey, yearname);
    _yearName = yearname;
    notifyListeners();
  }

  void setIsWelcome(bool isWelcome) async {
    await _sharedPreferences.setBool(_isWelcomeKey, isWelcome);
    _iswelcome = isWelcome;
    notifyListeners();
  }
  void setisclinical(bool isclinical) async {
    await _sharedPreferences.setBool(_isclinicalkey, isclinical);
    _isclinical = isclinical;
    notifyListeners();
  }
    void clearAllValues() async {
    await _sharedPreferences.clear();
    notifyListeners();
  }
}
