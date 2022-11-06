import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Widget? cardChild;
  final Function? onPress;

  ReusableCard({this.cardChild, this.onPress});

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return GestureDetector(
      onTap: widget.onPress as void Function()?,
      child: FadeTransition(
        opacity: _animation as Animation<double>,
        child: Container(
          child: widget.cardChild,
          padding: EdgeInsets.symmetric(horizontal: 18.3, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
