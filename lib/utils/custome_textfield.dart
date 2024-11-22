import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management_app/helper_objects/constants/colors.dart';
import 'package:task_management_app/utils/my_text.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText, label;
  final TextEditingController? controller;
  final Widget? preFixIcon;
  final Widget? sufFixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final int? maxLine;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final bool obscureText, isPassword;
  double radius;

  CustomTextField({
    super.key,
    this.isPassword = false,
    this.obscureText = false,
    this.label,
    this.radius = 10,
    this.preFixIcon,
    this.sufFixIcon,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator,
    this.textInputAction,
    this.keyBoardType,
    this.maxLine,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffE9ECEF),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.radius),
        ),
      ),
      child: Row(
        children: [
          Container(
            // margin: EdgeInsets.only(right: 0.sp),
            height: 32.sp,
            width: 33.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.radius),
                bottomLeft: Radius.circular(widget.radius),
              ),
            ),
            child: Center(
              child: widget.preFixIcon,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if(widget.label!.isNotEmpty)
                MyText(
                  text: widget.label.toString(),
                  textScale: 5.5.sp,
                  weight: FontWeight.w500,
                  color: colorBlack,
                ).paddingOnly(top: 15.sp),
                TextField(
                  obscuringCharacter: "*",
                  controller: widget.controller,
                  maxLength: widget.maxLength,
                  focusNode: widget.focusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  keyboardType: widget.keyBoardType,
                  maxLines: widget.isPassword == true ? 1 : widget.maxLine,
                  obscureText: widget.obscureText,
                  onSubmitted: widget.onFieldSubmitted,
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    hintStyle: TextStyle(
                      color: colorGrey,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0.sp),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    /* widget.isPasswordField
                        ? IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        : */
                  ),
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(right: 17.sp),
            height: 32.sp,
            width: 33.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.radius),
                bottomLeft: Radius.circular(widget.radius),
              ),
            ),
            child: Center(
              child: widget.sufFixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
