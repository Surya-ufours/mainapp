import 'package:flutter/material.dart';

class MultiDropDown extends StatelessWidget {
  final List items;
  final Function()? onTab;
  final String? hint;
  bool searchEnable;
  Widget? prefix;
  Color? containerColor;

  MultiDropDown(
    this.items, {
    Key? key,
    this.hint,
    this.prefix,
    this.onTab,
    this.searchEnable = false,
        this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor ?? Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(left: 12, right: 0, bottom: 0, top: 8),
        height: items.isEmpty ? 68 : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hint == null
                ? const SizedBox.shrink()
                : Row(
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
                        child: Text(hint ?? 'Select'),
                      ),
                    ],
                  ),
            Row(
              children: [
                hint == null ? prefix! : const SizedBox.shrink(),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 0,
                    children: List.generate(
                      items.length,
                      (index) {
                        return Chip(
                          label: Text(
                            items[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                          backgroundColor: Colors.black87,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
