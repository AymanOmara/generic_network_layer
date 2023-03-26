import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TF extends StatelessWidget {
  const TF({
    Key? key,
    required this.textLabel,
    required this.validationMode,
    required this.onChange,
    required this.validator,
    this.iconButton,
    this.secured,
    required this.tFType,
    this.space,
    this.fontSize,
    this.prefixIcon,
  }) : super(key: key);
  final String textLabel;
  final double? space;

  final Function(String txt) onChange;
  final String? Function(String? txt) validator;
  final IconButton? iconButton;
  final AutovalidateMode validationMode;
  final TFType tFType;
  final bool? secured;
  final double? fontSize;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          onChanged: (txt) => onChange(txt),
          autovalidateMode: validationMode,
          validator: (value) => validator(value),
          obscureText: secured == null ? false : secured!,
          inputFormatters: tFType == TFType.float
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp("[\u0660-\u0669\u06F0-\u06F9.]|[0-9.]+"),
                  ),
                ]
              : tFType == TFType.int
                  ? [
                      FilteringTextInputFormatter.allow(
                        RegExp("[\u0660-\u0669\u06F0-\u06F9]|[0-9]+"),
                      ),
                    ]
                  : [],
          keyboardType: tFType == TFType.float
              ? const TextInputType.numberWithOptions(decimal: true)
              : tFType == TFType.int
                  ? TextInputType.number
                  : tFType == TFType.name
                      ? TextInputType.name
                      : TextInputType.text,
          decoration: InputDecoration(
            // focusColor: MyColor.mainColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: iconButton,
            prefixIcon: prefixIcon,
            labelText: textLabel,
            labelStyle: TextStyle(fontSize: fontSize ?? 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          height: space ?? 10,
        ),
      ],
    );
  }
}

enum TFType { txt, float, int, email, name, password }
