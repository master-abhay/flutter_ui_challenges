import 'dart:math';

import 'package:flutter/material.dart';

class AnimationTutorial1 extends StatefulWidget {
  const AnimationTutorial1({super.key});

  @override
  State<AnimationTutorial1> createState() => _AnimationTutorial1State();
}

class _AnimationTutorial1State extends State<AnimationTutorial1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2,),);
    _animation = Tween<double>(begin: 0.0,end: 2 * pi).animate(_animationController); // .animate returns the animation
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 

        AnimatedBuilder(
          animation: _animationController,
          builder: (context,child){
            return Transform(
              transform: Matrix4.identity()..rotateY(_animation.value),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 3,
                          blurRadius: 10,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(0,0)
                      )
                    ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
