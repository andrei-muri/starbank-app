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
              color: Color(0xff0F0B30),
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
                  const BorderSide(color: Color(0xff57528F), width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Color(0xff57528F),
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  const BorderSide(color: Color(0xff1B1840), width: 1.0)),
          filled: true,
          fillColor:
              _isFocused ? const Color(0xff958ED8) : const Color(0xffaba5e5),
          prefixIcon: Icon(widget.prefixIcon, color: const Color(0xff242143)),
          labelText: widget.label,
          labelStyle: TextStyle(
              fontSize: _isFocused ? 20 : null,
              color: _isFocused
                  ? const Color(0xffE8E6FC)
                  : const Color(0xff1B1840)),
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon, color: const Color(0xff242143))
              : null,
        ),
      ),
    );
  }
}
