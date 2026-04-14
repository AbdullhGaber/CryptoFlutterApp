import 'package:flutter_project_2/core/utils/app_val.dart';
import 'package:flutter/material.dart';
import '../../core/theme/styles/app_colors.dart';
import '../../core/helpers/responsive.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final String? actionText;
  final VoidCallback? onActionTap;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.actionText,
    this.onActionTap,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
            if (widget.actionText != null)
              GestureDetector(
                onTap: widget.onActionTap,
                child: Text(
                  widget.actionText!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Responsive.text(context, AppVal.val14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        AppVal.verticalSpace8(context),

        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: AppVal.borderRadius16(context),
              borderSide: const BorderSide(color: Colors.orange, width: 1.5),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppRawColors.textSecondaryDark,
                      size: AppVal.icon20(context),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
