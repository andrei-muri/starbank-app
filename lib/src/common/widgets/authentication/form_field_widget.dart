import 'package:app_first_may/src/constants/colors.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String label;

  const FormFieldWidget(
      {super.key,
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
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  const BorderSide(color: CustomColors.inputFieldsBorderColor, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: CustomColors.inputFieldsBorderColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  const BorderSide(color: CustomColors.inputFieldsBorderFocusedColor, width: 1.0)),
          filled: true,
          fillColor:
              _isFocused ? CustomColors.inputFieldsFillFocusedColor  : CustomColors.inputFieldsFillColor,
          prefixIcon: Icon(widget.prefixIcon, color: CustomColors.backgroundColor),
          labelText: widget.label,
          labelStyle: TextStyle(
              fontSize: _isFocused ? 20 : null,
              color: _isFocused
                  ? CustomColors.inputFieldsTextFocusedColor
                  : CustomColors.inputFieldsTextColor),
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon, color: CustomColors.backgroundColor)
              : null,
        ),
      ),
    );
  }
}
