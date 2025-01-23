import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  int currentNumber = 12;
  int nextNumber = 11;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _flipAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // 자동으로 애니메이션 시작
    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward().then((_) {
      setState(() {
        currentNumber = nextNumber;
        nextNumber = (nextNumber - 1) < 0 ? 59 : nextNumber - 1;
      });
      _controller.reset();
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Stack(
          children: [
            // 위쪽 숫자 (현재 숫자 상단)
            Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective
                ..rotateX(_flipAnimation.value * -3.14 / 2),
              child: _buildNumber(currentNumber),
            ),

            // 아래쪽 숫자 (다음 숫자 하단)
            Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX((1 - _flipAnimation.value) * 3.14 / 2),
              child: _buildNumber(nextNumber),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumber(int number) {
    return Container(
      width: 100,
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
