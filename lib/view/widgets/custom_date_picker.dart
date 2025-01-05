
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:innbucks/util/dimensiona.dart';
import 'package:innbucks/util/style.dart';

class CustomDatePicker extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextAlign textAlign;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String value)? onChanged;
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
  final List<TextInputFormatter>? inputFormatter;
  final TextStyle? style;
  final double? borderRadius;

  const CustomDatePicker({
    super.key,
    this.hintText = 'Write something...',
    required this.controller,
    this.focusNode,
    this.style,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixIcon,
    this.borderRadius,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.inputDecoration,
    this.hintStyle,
    this.errorText,
    this.fillColor,
    this.borderColor,
    this.inputFormatter,
    this.textAlign = TextAlign.start,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  bool _obscureText = true;
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () async {
        DateTime pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101)) as DateTime;

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            dateinput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      controller: dateinput,
      focusNode: widget.focusNode,
      style: widget.style ??
          robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Theme.of(context).cardColor,
            hintStyle: widget.hintStyle ??
                robotoRegular.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).hintColor,
                ),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall),
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
                : null,
            errorText: widget.errorText,
            errorBorder: InputBorder.none,
            focusedBorder: widget.borderColor == null
                ? null
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 0),
                    borderSide: BorderSide(color: widget.borderColor!),
                  ),
            enabledBorder: widget.borderColor == null
                ? null
                : OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 0),
                    borderSide: BorderSide(color: widget.borderColor!),
                  ),
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
