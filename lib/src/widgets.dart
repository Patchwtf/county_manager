import 'package:flutter/material.dart';

class mnuBar extends StatelessWidget {
  mnuBar({required this.colorin, this.escuincle, this.puchale});
  final Color colorin;
  final Widget? escuincle;
  final Function()? puchale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: puchale,
      child: Container(
        child: escuincle,
        decoration: BoxDecoration(
          color: colorin,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              detail,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton(
      {required this.child, required this.onPressed, this.bg_color});
  final Widget child;
  final void Function() onPressed;
  final bg_color;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple),
            backgroundColor: bg_color),
        onPressed: onPressed,
        child: child,
      );
}

class Cajita extends StatelessWidget {
  Cajita({required this.colorin, this.escuincle, this.puchale});
  final Color colorin;
  final Widget? escuincle;
  final Function()? puchale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: puchale,
      child: Container(
        child: escuincle,
        margin: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: colorin,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
