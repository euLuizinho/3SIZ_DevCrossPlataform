import 'package:flutter/material.dart';

class InputCostum extends StatelessWidget {
  final TextEditingController controller;

  const InputCostum({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
    );
  }
}