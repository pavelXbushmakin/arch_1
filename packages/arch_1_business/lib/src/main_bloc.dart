import 'dart:async';
import 'package:arch_1_data/arch_1_data.dart';
import 'package:injectable/injectable.dart';


@injectable
class MainBloc {
  final HealthService healthService;
  final StreamController<int> _eventsController = StreamController();

  MainBloc({
    required this.healthService,
  });

  void add(int event) {
    if (_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose() {
    _eventsController.close();
  }
}