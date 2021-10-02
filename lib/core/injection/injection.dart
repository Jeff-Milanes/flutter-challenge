import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt locator = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(locator, environment: env);
}
