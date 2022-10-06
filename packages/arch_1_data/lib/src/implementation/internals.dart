import 'package:injectable/injectable.dart';

import '../api/services.dart';

@LazySingleton(as: HealthService)
class DummyService implements HealthService {
  @override
  bool getHealth() {
    return true;
  }
}