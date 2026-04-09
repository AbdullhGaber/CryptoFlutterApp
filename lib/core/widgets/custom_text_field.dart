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
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (widget.actionText != null)
              GestureDetector(
                onTap: widget.onActionTap,
                child: Text(
                  widget.actionText!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Responsive.text(context, 14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: Responsive.value(context, 8)),

        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Responsive.value(context, 16)),
              borderSide: const BorderSide(color: Colors.orange, width: 1.5), 
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppRawColors.textSecondaryDark,
                      size: Responsive.icon(context, 20),
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