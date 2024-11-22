import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LabelTextField extends StatelessWidget {
  String? labelText, hint;
  double font;
  FontWeight weight;
  Widget? suffix, prefix;
  TextEditingController? controller;
  int? maxLines;
  String? Function(String?)? validator;
  void Function(String)? onChanged;

  LabelTextField({
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.controller,
    this.prefix,
    this.suffix,
    this.hint,
    this.font = 14,
    this.weight = FontWeight.w400,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        color: Color(0xff1A1A1A),
        fontSize: font,
        fontWeight: weight,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefix != null
            ? SizedBox(
                height: 15.sp,
                width: 15.sp,
                child: Center(child: prefix),
              )
            : null,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: font,
          color: Color(0xff3C3C43).withOpacity(0.6),
          fontWeight: weight,
        ),
        hintStyle: TextStyle(
          fontSize: font,
          color: Color(0xff999999),
          fontWeight: weight,
        ),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Color(0xffE6E6E6),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Color(0xff1A1A1A),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        suffixIcon: SizedBox(
          height: 15.sp,
          width: 15.sp,
          child: Center(child: suffix),
        ),
      ),
    );
  }
}
