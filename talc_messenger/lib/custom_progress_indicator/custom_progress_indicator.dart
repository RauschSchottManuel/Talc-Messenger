import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:talc_messenger/custom_progress_indicator/custom_progress_indicator_painter.dart';

class TalcCustomProgressbarIndicator extends StatefulWidget {
  const TalcCustomProgressbarIndicator({Key? key}) : super(key: key);

  @override
  State<TalcCustomProgressbarIndicator> createState() =>
      _TalcCustomProgressbarIndicatorState();
}

class _TalcCustomProgressbarIndicatorState
    extends State<TalcCustomProgressbarIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _currentValue;
  late double _nextValue;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentValue = 0.0;
    _nextValue = 0.0;
    initAnimationController();
  }

  initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(
        () {
          setState(() {
            _currentValue =
                lerpDouble(_currentValue, _nextValue, _controller.value)!;
          });
        },
      );

    var timer = Timer.periodic(const Duration(milliseconds: 2000), handleTimer);
    handleTimer(timer);
  }

  handleTimer(Timer timer) {
    _timer = timer;
    animateStep();
  }

  animateStep() {
    setState(() {
      _currentValue = _nextValue;
      _nextValue += 0.1;
      if (_nextValue > 1.0) {
        _currentValue = 0.0;
        _nextValue = 0.0;
      }
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 130.0,
      child: CustomPaint(
        painter: TalcCustomProgressBarPainter(progress: _controller.value),
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _controller.dispose();
    super.dispose();
  }
}
