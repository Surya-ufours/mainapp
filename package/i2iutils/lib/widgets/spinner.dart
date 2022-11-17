import 'package:flutter/material.dart';

/*
* uasge
* use map<key,value>
* in example
* List=[
*   {
*     'id' : companyId, @required
*     'value' : companyName, @required
*     'some_key' : some extra values as per need ...
*   },
* ]
*
*
* */
class Spinner extends StatelessWidget {
  final String? value;
  final List<Map<String, String>> items;
  final Function(String?)? onChanged;
  final String? hint;
  final double? width;
  final double? fontSize;
  final EdgeInsets? padding;

  Spinner(
    this.value,
    this.items, {
    required this.onChanged,
    this.hint,
    this.width,
    this.fontSize,
        this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 45,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 0.5)]),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            hint ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          value: value,
          items: buildDropdownItem(
            items,
            fontSize: fontSize,
          ),
          onChanged: onChanged,
          //ontab unfocus keyboard need to add
          isExpanded: true,
          style: TextStyle(
            fontSize: fontSize ?? 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  buildDropdownItem(
    List<Map<String, String>> items, {
    double? fontSize,
  }) {
    return items
        .map((e) => DropdownMenuItem<String>(
              value: e['id'],
              child: Text(
                '${e['value']}',
              ),
            ))
        .toList();
  }
}

Map<String, String> getMapItem(
    List<Map<String, String>> items, String selected) {
  return items.firstWhere((element) => element['id'] == selected,
      orElse: () => {});
}
