import 'package:app_first_may/src/common/styles/form_field_style.dart';
import 'package:app_first_may/src/constants/colors.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String label;

  const FormFieldWidget(
      {super.key,
      required this.validator,
      required this.controller,
      required this.prefixIcon,
      required this.label,
      this.suffixIcon});

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus != _isFocused) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: CustomColors.shadowColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1.5, 2))
        ],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        focusNode: _focusNode,
        decoration: FormFieldInputDecoration.lilaInputDecoration(_isFocused, widget.prefixIcon, widget.suffixIcon, widget.label), 
    ));
  }
}
