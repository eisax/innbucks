
import 'package:flutter/material.dart';
import 'package:innbucks/util/dimensiona.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> items;
  final String selectedValue;
void Function(String?)? onChanged;
  CustomDropdownWidget({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,vertical: Dimensions.paddingSizeExtraSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        color: Theme.of(context).disabledColor.withOpacity(0.2)
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox(),
        style: const TextStyle(
          color: Colors.black, 
        ),
        iconEnabledColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down),
        hint: const Text(
          'Select',
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 16,
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Colors.white, 
      ),
    );
  }
}