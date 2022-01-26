import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomTextFieldAutoComplete<T> extends StatelessWidget {
  final List<T> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSuggestionSelected;
  final Widget? prefixIcon;
  final String label;
  final TextEditingController controller;

  const CustomTextFieldAutoComplete({
    Key? key,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSuggestionSelected,
    required this.label,
    required this.controller,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      debounceDuration: const Duration(milliseconds: 500),
      suggestionsCallback: suggestionsCallback,
      itemBuilder: itemBuilder,
      onSuggestionSelected: onSuggestionSelected,
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: ColorText.SECOND),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorText.PRIMARY),
          ),
          prefixIcon: prefixIcon,
          label: Text(
            label,
            style: const TextStyle(fontSize: 16, color: ColorText.PRIMARY),
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorText.PRIMARY),
          ),
        ),
      ),
    );
  }
}
