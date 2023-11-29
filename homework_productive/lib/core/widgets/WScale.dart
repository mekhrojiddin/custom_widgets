
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';


class WScaleAmination extends StatefulWidget {
  final Function() onTap;
  final Widget child;
  final bool isDisabled;

  const WScaleAmination({
    required this.isDisabled,
    required this.onTap,
    required this.child,
    super.key,
  });

  @override
  State<WScaleAmination> createState() => _WScaleAminationState();
}

class _WScaleAminationState extends State<WScaleAmination> with SingleTickerProviderStateMixin{
  late Animation<double>scaleAnimation;
  late AnimationController scaleAnimationController;
  @override
  void initState() {
    scaleAnimationController=AnimationController(vsync: this, duration: Duration(seconds: 1));
    scaleAnimation=Tween<double>(begin: 1,end: 0.5).animate(scaleAnimationController);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!widget.isDisabled){
          widget.onTap();
        }
      },
      onPanDown: (_){
        if(!widget.isDisabled){
          scaleAnimationController.forward();
          setState(() {

          });
        }
      },
      onPanCancel: (){
        if(!widget.isDisabled){
          scaleAnimationController.reverse();
          setState(() {

          });
        }
      },
      onPanEnd: (_){
        if(!widget.isDisabled){
          scaleAnimationController.reverse();
          setState(() {

          });
        }
      },
      child: ScaleTransition(
        scale: scaleAnimation,
        child: widget.child,
      ),
    );
  }
  @override
  void dispose() {
    scaleAnimationController.dispose();
    super.dispose();
  }
}
