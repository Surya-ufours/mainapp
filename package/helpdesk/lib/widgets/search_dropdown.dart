import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SearchDropDown extends StatelessWidget {
  final Function(String?)? onChanged;
  final Map<String, int> items;
  final String? label;
  final String? hint;
  final String? selectedItem;
  bool searchEnable;
  Widget? prefix;
  bool isEnabled;
  Color? containerColor;


  SearchDropDown(
    this.items,
    this.selectedItem, {
    Key? key,
    @required this.onChanged,
    this.label,
    this.hint,
    this.prefix,
    this.searchEnable = false,
    this.isEnabled = true,
        this.containerColor,

      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor ?? Colors.black.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 12, right: 0, bottom: 0),
      height: 68,
      child: Row(
        children: [
          prefix != null
              ? Row(
                  children: [
                    prefix!,
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          Expanded(
            child: DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                enabled: isEnabled,
                dropdownBuilder: (_, str) {
                  return Text(
                    str == null || str.isEmpty ? 'Select' : str,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  );
                },
                dropDownButton: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 14,
                ),
                showSelectedItems: true,
                popupShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                popupTitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        label ?? 'Select',
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                items: items.keys.toList(),
                dropdownSearchDecoration: InputDecoration(
                    labelText: label, hintText: hint, border: InputBorder.none),
                onChanged: onChanged,
                showSearchBox: searchEnable,
                selectedItem: selectedItem),
          ),
        ],
      ),
    );
  }
}
