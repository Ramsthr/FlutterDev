import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  double _buttonradius = 100;
  bool _six = false;
  final Tween<double> _backgroundScale = Tween(begin: 0.0, end: 1.0);
  AnimationController? _starAnimationController;
  @override
  void initState() {
    _starAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
    _starAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackgroud(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularanimationbutton(),
                _starIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageBackgroud() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: Duration(seconds: 2),
      builder: (_context, _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget _circularanimationbutton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_buttonradius == 300) {
              _six = true;
            }
            if (_buttonradius == 100) {
              _six = false;
            }
            if (_six) {
              _buttonradius -= 50;
            } else {
              _buttonradius = _buttonradius + 50;
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.elasticInOut,
          width: _buttonradius,
          height: _buttonradius,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(_buttonradius),
          ),
          child: Center(
            child: Text(
              "data",
              style: TextStyle(fontSize: _buttonradius * 0.3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starAnimationController!.view,
      builder: (_context, _child) {
        return Transform.rotate(
          angle: _starAnimationController!.value * 2 * pi,
          child: _child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 100,
        color: Colors.black38,
      ),
    );
  }
}
