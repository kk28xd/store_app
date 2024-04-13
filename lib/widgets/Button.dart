import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.label, this.on});
  final String label;
  final void Function()? on;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: on,
      color: Colors.lightBlueAccent,
      minWidth: 200,
      height: 50,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 0)),
      child: Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}