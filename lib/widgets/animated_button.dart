import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double height, width;
  final bool loading;
  final Function onPressed;
  final Widget child;
  final Color? loadColor;
  final double? radius;
  final Color? backGroundColor;
  const AnimatedButton(
      {Key? key,
      required this.loading,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.child,
      this.radius,
      this.loadColor,
      this.backGroundColor})
      : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: widget.loading ? 120 : widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backGroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(widget.radius ?? 25)),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed.call();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                widget.backGroundColor ?? Theme.of(context).primaryColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 25)))),
        child: widget.loading
            ? Center(
                child: CircularProgressIndicator(
                color: widget.loadColor,
              ))
            : widget.child,
      ),
    );
  }
}
