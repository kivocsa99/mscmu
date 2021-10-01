import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pref_changenotifier.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferences = FutureProvider<SharedPreferences>(
    (ref) async => await SharedPreferences.getInstance());
final downloader =
    FutureProvider<FlutterDownloader>((ref) async =>  FlutterDownloader());
    
final prefChangeNotifierProvider =
    ChangeNotifierProvider<PrefChangeNotifier>((ref) {
  final sharePreferencesData = ref.watch(sharedPreferences).data;
  late final prefs;

  if (sharePreferencesData != null) {
    prefs = sharePreferencesData.value;
  }

  return PrefChangeNotifier(prefs);
});
