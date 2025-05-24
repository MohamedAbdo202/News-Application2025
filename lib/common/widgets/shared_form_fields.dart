import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_constants/app_colors.dart';
import '../styles/app_style.dart';

Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  String? label,

  ///Reusable Form Field
  bool isPassword = false,
  bool isClickable = true,
  int? maxLength,
  bool? showCursor,
  double height = 56,
  double? width,
  FocusNode? focusNode,
  Color prefixColor = AppColors.blueColor,
  Color suffixColor = AppColors.blueColor,
  Color fillColor = AppColors.grayColor,
  Color borderColor = AppColors.grayColor,
  TextAlign labelTextAlign = TextAlign.start,
  List<TextInputFormatter>? inputFormatter,
  bool showLabel = false,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  void Function()? onTap,
  String? Function(String?)? validator,
  IconData? prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  int maxLines = 1,
  String? iconPath,
}) =>
    SizedBox(
      width: width,
      child: TextFormField(
        showCursor: showCursor,
        maxLength: maxLength,
        inputFormatters: inputFormatter,
        maxLines: maxLines,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        cursorColor: AppColors.grayColor,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        textAlign: labelTextAlign,
        onTap: onTap,
        textInputAction: TextInputAction.next,
        style: Styles.blackColorStyle13,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please Fill Data';
              }
              return null;
            },
        focusNode: focusNode,
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior: showLabel
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
          alignLabelWithHint: !showLabel,
          filled: true,
          fillColor: fillColor,
          labelText: label,
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: prefixColor,
                )
              : null,
          suffixIcon: suffix is IconData // Check if suffix is IconData
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix as IconData?,
                    color: suffixColor,
                  ),
                )
              : suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            // Initial border radius

            borderSide: const BorderSide(
              color: AppColors.grayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          contentPadding:
              prefix != null ? null : EdgeInsets.symmetric(horizontal: 15.w),
          labelStyle: Styles.blackColorStyle13,
        ),
      ),
    );
