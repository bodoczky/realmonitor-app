import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SearchAnimationWidget extends StatefulWidget {
  const SearchAnimationWidget({Key? key}) : super(key: key);

  @override
  State<SearchAnimationWidget> createState() => _SearchAnimationWidgetState();
}

class _SearchAnimationWidgetState extends State<SearchAnimationWidget> {
  late Timer _timer;

  SMIBool? _bump;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _changeState(!_bump!.value);
      });
    });
  }

  void _changeState(bool isActive) => _bump?.change(isActive);
  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
        artboard, 'SEARCH_Interactivity',
        onStateChange: _onStateChange);
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('active') as SMIBool;
  }

  void _onStateChange(
    String stateMachineName,
    String stateName,
  ) =>
      setState(() {});

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: RiveAnimation.asset(
          'assets/animations/icon_anim.riv',
          artboard: "SEARCH",
          onInit: _onRiveInit,
        ));
  }
}
