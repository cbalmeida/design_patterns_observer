import 'dart:async';

import 'package:flutter/cupertino.dart';

class Counter {
  int _value = 0;

  void incrementValue() {
    _value++;
  }

  int getValue() {
    return _value;
  }
}

class TimedCounter with ChangeNotifier {
  Counter _counter = Counter();

  Timer _timer;

  void _startCounter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _incrementCounter();
    });
    print("startCounter = " + _counter.getValue().toString());
  }

  void _stopCounter() {
    _timer.cancel();
    _timer = null;
    print("stopCounter = " + _counter.getValue().toString());
  }

  void _incrementCounter() {
    _counter.incrementValue();
    notifyListeners();
    print("incrementCounter  = " + _counter.getValue().toString());
  }

  int getValue() {
    return _counter.getValue();
  }

  void toggleCounter() {
    if (_timer != null)
      _stopCounter();
    else
      _startCounter();
  }

  bool isTimerActive() {
    return (_timer != null);
  }
}
