import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
