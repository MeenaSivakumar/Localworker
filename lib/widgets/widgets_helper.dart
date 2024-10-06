import 'package:flutter/material.dart';
import 'package:work_zone/utils/app_theme.dart';

class WidgetHelper {
  static Widget customTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
    bool showPasswordToggle = false,
  }) {
    bool isPasswordVisible = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: isPassword && isPasswordVisible,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            fillColor: AppTheme.whiteColor,
            filled: true,
            labelText: labelText,
            labelStyle: AppTheme.themeData.inputDecorationTheme.labelStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppTheme.primaryColor),
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: showPasswordToggle
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
