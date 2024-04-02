import 'package:flutter/material.dart';

import '../utils/colors.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.readonly,
    required this.tapped,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool readonly;
  final VoidCallback tapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(label,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
    const SizedBox(height:6),
    TextFormField(
      onTap: tapped,
      readOnly: readonly,
      controller:controller,
      decoration:InputDecoration(
        fillColor: Color.fromARGB(255, 235, 235, 243),
        filled:true,
        hintText: hint,
        suffixIcon: Icon(icon,color:Palette.primarycolor),
        contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide:BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        )
    
      )
    )
    
      ],
    );
  }
}