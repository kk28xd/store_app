import 'package:flutter/material.dart';

class txtField extends StatelessWidget {
  const txtField({super.key, required this.label,this.txt, this.inputType, this.onChanged,});
  final void Function(String)? onChanged;
  final String label;
  final TextEditingController? txt;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: inputType,
      controller: txt,
      decoration: InputDecoration(
          label: Text(label, style: const TextStyle()),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide())),
    );
  }
}