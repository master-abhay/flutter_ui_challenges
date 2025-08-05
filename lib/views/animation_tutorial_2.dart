import 'package:flutter/material.dart';

class AnimationTutorial2 extends StatefulWidget {
  const AnimationTutorial2({super.key});

  @override
  State<AnimationTutorial2> createState() => _AnimationTutorial2State();
}

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
    }

    /// draw arc
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({required this.side});

  @override
  getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => true;
}

class _AnimationTutorial2State extends State<AnimationTutorial2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _buildUi()));
  }

  Widget _buildUi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// left half circle
        ClipPath(
          clipper: HalfCircleClipper(side: CircleSide.left),
          child: Container(width: 100, height: 100, color: Colors.indigo),
        ),

        /// right half circle
        ClipPath(
          clipper: HalfCircleClipper(side: CircleSide.right),
          child: Container(width: 100, height: 100, color: Colors.amber),
        ),
      ],
    );
  }
}
