import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';

class CustomTextFormField extends StatefulWidget
{
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String fieldInnerText;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final Color? innerColor;
  final Color? borderColor;
  


  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.fieldInnerText,
    this.onChanged,
    this.isPassword =false,
    this.innerColor,
    this.borderColor
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured =true;

  void _toggleObsucre() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      validator: 
      widget.validator ?? (value){
        if (value == null || value.isEmpty){
          return "this field is required";
        }
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.innerColor ?? ColorManager.innerTextFieldColor,
        hintText: widget.fieldInnerText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7,
          ),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: _toggleObsucre,
          icon: Icon(_isObscured ? 
            Icons.visibility_off_outlined
            : Icons.visibility_outlined,
            color: const Color.fromARGB(255, 175, 175, 199),
          ),
        ):null ,
        border: OutlineInputBorder(
          borderRadius: .circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color:widget.borderColor ?? Color(0xFFDCDCE8),width: 1),
          
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(15),
          borderSide: BorderSide(color:Color(0xFFB8B8D2),width:1.2)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(color: ColorManager.errorDefaultColor)
        ),
      ),
    );
  }
}