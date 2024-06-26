import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'types/classes/env.dart';

late Env env;
late PackageInfo packageInfo;

Future<void> loadENV() async {
  String envString =
      await rootBundle.loadString('assets/env/config', cache: false);

  Map<String, String> envMap = {};

  for (final envLine in envString.split('\n')) {
    envMap.putIfAbsent(envLine.split('=')[0], () => envLine.split('=')[1]);
  }

  env = Env(
    brandName: envMap['BRAND_NAME'],
    apiURL: envMap['API_URL'],
    mockMode: bool.tryParse(envMap['MOCK_MODE'] ?? ''),
    imageShowAnimationMS: int.tryParse(envMap['IMAGE_SHOW_ANIMATION_MS'] ?? ''),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await loadENV();
  packageInfo = await PackageInfo.fromPlatform();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
