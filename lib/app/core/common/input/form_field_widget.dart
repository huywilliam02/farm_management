import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class FormFieldWidget extends StatelessWidget {
  FormFieldWidget(
      {super.key,
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
      this.padding = 0,
      this.suffixIcon,
      this.enableInteractiveSelection = true,
      this.styleInput = TextStyleConstant.black16Roboto,
      this.radiusBorder = 10.0,
      this.contentPadding});
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
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: TextFormField(
          style: styleInput,
          enableInteractiveSelection: enableInteractiveSelection,
          initialValue: initValue,
          enabled: isEnabled,
          obscureText: isObscureText,
          focusNode: focusNode,
          decoration: InputDecoration(
            errorText: errorText != "" ? errorText : null,
            border: InputBorder.none,
            fillColor: Colors.white70,
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
        ),
      ),
    );
  }
}
