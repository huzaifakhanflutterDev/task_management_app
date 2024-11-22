import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatefulWidget {
  String? Function(String?)? validator;
  String? hint, error, label;
  Function(bool)? isValid;
  Widget? suffix, prefix;
  Color fillColor;
  double? font;
  FontWeight weight;
  bool obscure, enabled, auto;
  Function()? onTap;
  TextInputType? textInputType;
  AutovalidateMode? autovalidateMode;
  TextEditingController? controller;

  MyTextField({
    this.textInputType,
    this.autovalidateMode,
    this.auto = false,
    this.error,
    this.onTap = null,
    this.enabled = true,
    this.obscure = false,
    this.controller,
    this.weight = FontWeight.w500,
    this.fillColor = Colors.transparent,
    this.prefix,
    this.suffix,
    this.validator,
    this.hint,
    this.font = 13,
    this.label,
    this.isValid,
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
    widget.isValid?.call(_isValid);
  }

  void _validate(String value) {
    if (widget.validator != null) {
      setState(
        () {
          isDirty = true;
          error = widget.validator!(value);
          _isValid = error == null;
          widget.isValid?.call(_isValid);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 10.sp),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDirty
                  ? (_isValid ? Colors.green : Colors.red)
                  : Color(0xffE6E6E6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Row(
            children: [
              if (widget.prefix != null)
                SizedBox(
                  height: 24.sp,
                  width: 19.sp,
                  child: Center(
                    child: widget.prefix,
                  ),
                ).paddingOnly(right: 15.sp),
              Expanded(
                child: TextFormField(
                  obscureText: widget.obscure,
                  enabled: widget.enabled,
                  onTap: widget.onTap,
                  autofocus: widget.auto,
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  autovalidateMode: widget.autovalidateMode,
                  style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontSize: widget.font,
                    fontWeight: widget.weight,
                  ),
                  decoration: InputDecoration(
                    fillColor: widget.fillColor,
                    hintStyle: TextStyle(
                      fontSize: widget.font,
                      color: Color(0xff999999),
                      fontWeight: widget.weight,
                    ),
                    hintText: widget.hint,
                    labelText: widget.label,
                    border: InputBorder.none,
                  ),
                  onChanged: _validate,
                ),
              ),
              isDirty
                  ? _isValid
                      ? SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/svgs/done.svg",
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/svgs/error.svg",
                            ),
                          ),
                        )
                  : SizedBox(
                      height: 18.sp,
                      width: 19.sp,
                      child: Center(
                        child: widget.suffix,
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: 2.5.sp),
        if (error != null)
          Text(
            error!,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
