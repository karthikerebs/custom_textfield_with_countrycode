import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom TextField widget that optionally includes a country code picker and password visibility toggle.
///
/// This widget provides a highly customizable text input field that can be used for:
/// * Regular text input
/// * Password input with visibility toggle
/// * Phone number input with country code selection
///
/// Example usage:
/// ```dart
/// CustomTextFieldWithCountryCode(
///   controller: TextEditingController(),
///   hintText: 'Enter phone number',
///   countrycode: true,
///   keyboardType: TextInputType.phone,
///   onCountryCodeChanged: (code) => print(code),
/// )
/// ```
class CustomTextFieldWithCountryCode extends StatefulWidget {
  /// Controller for managing the text input
  final TextEditingController controller;

  /// Placeholder text shown when the field is empty
  final String hintText;

  /// Label text displayed above the input field
  final String labelText;

  /// Optional icon to be displayed
  final IconData? icon;

  /// Width of the text field (defaults to full width)
  final double width;

  /// Maximum number of characters allowed in the field
  final int maxLength;

  /// Type of keyboard to show (e.g., number pad, email)
  final TextInputType keyboardType;

  /// Maximum number of lines for the input field
  final int maxLines;

  /// Input formatters to restrict/format input
  final List<TextInputFormatter>? inputFormatters;

  /// Validation function for the input field
  final FormFieldValidator<String>? validator;

  /// Whether the field is for password input
  final bool isPassword;

  /// Whether to show country code picker
  final bool countrycode;

  /// Callback for when country code changes
  final Function(String)? onCountryCodeChanged;

  /// Custom prefix icon widget
  final Widget? prefixIcon;

  /// Vertical margin around the field
  final double verticalMargin;

  /// Horizontal margin around the field
  final double horizontalMargin;

  /// Focus node for controlling field focus
  final FocusNode? focusNode;

  /// Callback for when field is tapped
  final VoidCallback? onTap;

  /// Whether the field is read-only
  final bool readOnly;

  /// Callback for when text changes
  final Function(String)? onChanged;

  /// Color of the password visibility toggle icon
  final Color? passwordIconColor;

  /// List of favorite country codes to show at top
  final List<String>? favCountryCode;

  /// Initial selected country code
  final String? initialSelectedCountry;

  /// Text style for the input field
  final TextStyle? textStyle;

  final InputDecoration? inputDecoration;

  const CustomTextFieldWithCountryCode({
    super.key,
    required this.controller,
    this.hintText = '',
    this.labelText = '',
    this.icon,
    this.width = double.infinity,
    this.maxLength = 2000,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.isPassword = false,
    this.countrycode = false,
    this.onCountryCodeChanged,
    this.prefixIcon,
    this.verticalMargin = 16,
    this.horizontalMargin = 0,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.onChanged,
    this.passwordIconColor,
    this.favCountryCode,
    this.initialSelectedCountry,
    this.textStyle,
    this.inputDecoration,
  });

  @override
  State<CustomTextFieldWithCountryCode> createState() =>
      _CustomTextFieldWithCountryCodeState();
}

class _CustomTextFieldWithCountryCodeState
    extends State<CustomTextFieldWithCountryCode> {
  /// Controls the visibility of password text
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: widget.width,
        margin: EdgeInsets.symmetric(
          vertical: widget.verticalMargin,
          horizontal: widget.horizontalMargin,
        ),
        child: TextFormField(
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          focusNode: widget.focusNode,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyLarge,
          decoration:
              widget.inputDecoration ??
              InputDecoration(
                suffixIcon:
                    widget.isPassword
                        ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: widget.passwordIconColor ?? Colors.grey,
                          ),
                        )
                        : null,
                prefixIcon:
                    widget.countrycode
                        ? _buildCountryCodePicker()
                        : widget.prefixIcon != null
                        ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: widget.prefixIcon,
                        )
                        : null,
                hintText: widget.hintText,
                labelText: widget.labelText,

                counter: const Offstage(),
              ),
          validator: widget.validator,
        ),
      ),
    );
  }

  /// Builds the country code picker widget with default settings
  ///
  /// Returns a [CountryCodePicker] widget configured with:
  /// * Initial selection (defaults to 'IN' for India)
  /// * Favorite countries list
  /// * Flag display
  /// * Callback handling for code changes
  CountryCodePicker _buildCountryCodePicker() {
    return CountryCodePicker(
      onInit: (CountryCode? countryCode) {
        if (widget.onCountryCodeChanged != null && countryCode != null) {
          widget.onCountryCodeChanged!(
            countryCode.dialCode ?? widget.initialSelectedCountry ?? '+91',
          );
        }
      },
      onChanged: (CountryCode countryCode) {
        if (widget.onCountryCodeChanged != null) {
          widget.onCountryCodeChanged!(countryCode.dialCode ?? '');
        }
      },
      initialSelection: widget.initialSelectedCountry ?? 'IN',
      favorite: widget.favCountryCode ?? const ['+91', 'IN'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      showFlag: true,
      showFlagMain: true,
      alignLeft: false,
      padding: EdgeInsets.zero,
    );
  }
}
