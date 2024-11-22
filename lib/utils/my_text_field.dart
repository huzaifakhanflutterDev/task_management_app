import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'my_text.dart';

class MyTextField extends StatefulWidget {
  String hint;
  String? label;
  Widget? suffix, prefix;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Color fillColor;
  double? font;
  FontWeight weight;
  bool obscure, enabled;
  Function()? onTap;
  final Function(bool)? inValid;
  String? errortext;

  MyTextField({
    this.inValid,
    this.errortext,
    this.label,
    this.onTap,
    this.enabled = true,
    this.obscure = false,
    this.controller,
    this.weight = FontWeight.w500,
    this.fillColor = Colors.transparent,
    this.validator,
    this.font = 12,
    this.prefix,
    this.suffix = const SizedBox(),
    required this.hint,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String? error;

  bool _isValid = true;
  bool isDirty = false;

  @override
  void initState() {
    super.initState();
    widget.inValid?.call(_isValid);
  }

  void _validate(String value) {
    if (widget.validator != null) {
      setState(() {
        isDirty = true;
        error = widget.validator!(value);
        _isValid = error == null;
        widget.inValid?.call(_isValid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(
              color: isDirty
                  ? (_isValid ? Colors.green : Colors.red)
                  : Colors.grey,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: widget.validator,
                  onTap: widget.onTap,
                  obscureText: widget.obscure,
                  onChanged: _validate,
                  style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: widget.font,
                    fontWeight: widget.weight,
                  ),
                  controller: widget.controller,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  enabled: widget.enabled,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: widget.label,
                    prefixIcon: widget.prefix,
                    border: InputBorder.none,
                    hoverColor: Color(0xffffffff),
                    focusColor: Color(0xffffffff),
                    hintText: widget.hint,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.width * .75.sp,
                    ),
                    hintStyle: TextStyle(
                      fontSize: widget.font,
                      color: Color(0xff999999),
                      fontWeight: widget.weight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        if (error != null)
          MyText(
            text: error!,
            textScale: 5.sp,
            color: Colors.red,
          ),
      ],
    );
  }
}
