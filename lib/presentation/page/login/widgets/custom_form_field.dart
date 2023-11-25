import 'package:flutter/material.dart';
import 'package:itfsd/app/core/constants/app_constants.dart';

class CustomFormFieldWidget extends StatelessWidget {
  CustomFormFieldWidget({
    super.key,
    this.focusNode,
    this.icon,
    this.errorText = "",
    this.labelText,
    this.controllerEditting,
    required this.setValueFunc,
    this.textInputType = TextInputType.text,
    this.isObscureText = false,
    this.isEnabled = true,
    this.initValue,
    this.padding = 10,
    this.suffixIcon,
    this.enableInteractiveSelection = true,
    this.styleInput = TextStyleConstant.black16Roboto,
    this.radiusBorder = 5.0,
  });
  final FocusNode? focusNode;
  final Icon? icon;
  final Widget? suffixIcon;
  String? errorText;
  final String? labelText;
  final TextEditingController? controllerEditting;
  final Function setValueFunc;
  final TextInputType textInputType;
  final bool isObscureText;
  final bool? isEnabled;
  final String? initValue;
  final double? padding;
  final bool? enableInteractiveSelection;
  final TextStyle? styleInput;
  final double? radiusBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: styleInput,
      enableInteractiveSelection: enableInteractiveSelection,
      initialValue: initValue,
      enabled: isEnabled,
      obscureText: isObscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        errorText: errorText != "" ? errorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder ?? 5),
        ),
        // labelText: labelText,
        hintText: labelText,
        hintTextDirection: TextDirection.ltr,
        hintMaxLines: 3,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
      controller: controllerEditting,
      onChanged: (value) {
        setValueFunc(value);
      },
    );
  }
}
