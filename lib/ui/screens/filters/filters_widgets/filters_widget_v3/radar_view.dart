import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ingatlan_figyelo_teszt/ui/screens/filters/filters_widgets/filters_widget_v3/radar_painter.dart';

class RadarView extends StatefulWidget {
  const RadarView({Key? key}) : super(key: key);

  @override
  State<RadarView> createState() => _RadarViewState();
}

class _RadarViewState extends State<RadarView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  bool _pointVisible = false;
  final GlobalKey _radarBoxKey = GlobalKey();
  double _height = 0;
  double _width = 0;
  double _pointX = 0;
  double _pointY = 0;

  @override
  void initState() {
    _timer =
        Timer.periodic(const Duration(seconds: 2), _generateHouseIconPosition);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = Tween(begin: .0, end: pi * 2).animate(_controller);
    _controller.repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _findRadarBoxData();
    });
    super.initState();
  }

  void _findRadarBoxData() {
    RenderBox renderBox =
        _radarBoxKey.currentContext!.findRenderObject()! as RenderBox;
    _height = renderBox.size.height;
    _width = renderBox.size.width;
  }

  void _generateHouseIconPosition(Timer timer) {
    if (mounted) {
      if (!_pointVisible) {
        _pointX = Random().nextInt((_width - (_width / 5)).toInt()).toDouble();
        _pointX = _pointX.clamp((_width / 5),
            (_width - (_width / 2))); //to avoid edges and top right corner

        _pointY =
            Random().nextInt((_height - (_height / 5)).toInt()).toDouble();
        _pointY = _pointY.clamp((_height / 5),
            (_height - (_height / 2))); //to avoid edges and top right corner

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _pointVisible = !_pointVisible;
          });
        });
      } else {
        setState(() {
          _pointVisible = !_pointVisible;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _radarBoxKey,
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              //print(_animation.value);
              return CustomPaint(
                painter: RadarPainter(_animation.value),
              );
            },
          ),
        ),
        Positioned(
          left: _pointX,
          bottom: _pointY,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _pointVisible ? 1 : 0,
            curve: Curves.easeIn,
            child: ClipOval(
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  child: const Icon(
                    Icons.home_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
