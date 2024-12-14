import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  late final Timer _timer;
  late int _currentMinutes;

  TimerCubit() : super(0) {
    _currentMinutes = 0;

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _passTime()
    );
  }

  void _passTime() {
    ++_currentMinutes;
    emit(_currentMinutes);
  }

  @override
  void emit(int state) {
    if (isClosed) return;
    super.emit(state);
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
