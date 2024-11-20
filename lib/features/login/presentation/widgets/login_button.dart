import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.label,
      this.onPressed,
      this.icon,
      this.buttonColor});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), backgroundColor: buttonColor,
      ),
      icon: icon != null ? Icon(icon, color: Colors.white) : const SizedBox(),
      onPressed: onPressed,
    );
  }
}
