import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innbucks/util/dimensiona.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final double? borderRadius;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String value)? onChanged;
  final void Function()? onTap;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyle;
  final String? errorText;
  final Color? fillColor;
  final Color? borderColor;
  final IconData? suffixicon;
  final bool isReadOnly;
  final Color? suffixiconcolor;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextField({
    super.key,
    this.isReadOnly = false,
    this.hintText = 'Write something...',
    required this.controller,
    this.borderRadius,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.inputDecoration,
    this.onTap,
    this.hintStyle,
    this.errorText,
    this.fillColor,
    this.borderColor,
    this.inputFormatter,
    this.suffixicon,
    this.suffixiconcolor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).primaryColor,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      autofillHints: widget.inputType == TextInputType.name
          ? [AutofillHints.name]
          : widget.inputType == TextInputType.emailAddress
              ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone
                  ? [AutofillHints.telephoneNumber]
                  : widget.inputType == TextInputType.streetAddress
                      ? [AutofillHints.fullStreetAddress]
                      : widget.inputType == TextInputType.url
                          ? [AutofillHints.url]
                          : widget.inputType == TextInputType.visiblePassword
                              ? [AutofillHints.password]
                              : null,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputFormatter ??
          (widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                ]
              : null),
      decoration: widget.inputDecoration ??
          InputDecoration(
            contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimensions.radiusSmall),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Theme.of(context).cardColor,
            hintStyle: widget.hintStyle ??
                Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeExtraSmall),
                    child:
                        Image.asset(widget.prefixIcon!, height: 20, width: 20),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : Icon(widget.suffixicon, color: widget.suffixiconcolor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimensions.radiusSmall),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
                width: 0.25,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimensions.radiusSmall),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
                width: .25,
              ),
            ),
            errorText: widget.errorText,
            errorBorder: InputBorder.none,
          ),
      onSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit!(text)
              : null,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
