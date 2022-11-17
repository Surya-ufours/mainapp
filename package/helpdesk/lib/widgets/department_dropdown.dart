import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/model/department_response.dart';

class DepartmentDropDown extends StatelessWidget {
  final Function(Department?)? onChanged;
  final List<Department> items;
  final String? label;
  final String? hint;
  final Department? selectedItem;
  bool searchEnable;
  Widget? prefix;

  DepartmentDropDown(
    this.items,
    this.selectedItem, {
    Key? key,
    @required this.onChanged,
    this.label,
    this.hint,
    this.prefix,
    this.searchEnable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 12, right: 0, bottom: 0),
      height: 68,
      child: Row(
        children: [
          prefix != null
              ? Row(
                  children: [
                    selectedItem != null
                        ? CachedNetworkImage(
                            imageUrl: selectedItem!.departmentLogoFileName,
                            width: 20,
                          )
                        : prefix!,
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          Expanded(
            child: DropdownSearch<Department>(
                mode: Mode.BOTTOM_SHEET,
                dropdownBuilder: (_, str) {
                  return Text(
                    str == null ? 'Select' : str.departmentName,
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
                showSelectedItems: false,
                popupShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                popupTitle: Container(
                  color: Colors.white,
                  child: Padding(
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
                ),
                popupItemBuilder: (_, dept, isSelected) {
                  return ListTile(
                    selected:
                        dept.departmentID == (selectedItem?.departmentID ?? -1),
                    selectedTileColor: Colors.redAccent,
                    selectedColor: Colors.white,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CachedNetworkImage(
                        width: 25,
                        imageUrl: dept.departmentLogoFileName,
                      ),
                    ),
                    title: Text(dept.departmentName),
                    subtitle: Text(dept.departmentDescription),
                  );
                },
                items: items,
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
