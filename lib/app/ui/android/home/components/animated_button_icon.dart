import 'package:flutter/material.dart';

class AnimationIconButton extends StatefulWidget {
  final Icon selectedIcon;
  final Icon unSelectedIcon;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  const AnimationIconButton({
    required this.selectedIcon,
    required this.unSelectedIcon,
    this.onTap,
    this.padding = const EdgeInsets.only(right: 10, left: 10),
  });

  @override
  _AnimationIconButtonState createState() => _AnimationIconButtonState();
}

class _AnimationIconButtonState extends State<AnimationIconButton>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.3,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onTapDown(TapDownDetails details) async {
    _animationController.forward().then((value) {
      Future.delayed(Duration(milliseconds: 100));
      _animationController.reverse();
      setState(() {
        isSelected = !isSelected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final scale = 1 + _animationController.value;
    return GestureDetector(
      onTapDown: onTapDown,
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: Transform.scale(
          scale: scale,
          child: isSelected ? widget.selectedIcon : widget.unSelectedIcon,
        ),
      ),
    );
  }
}
