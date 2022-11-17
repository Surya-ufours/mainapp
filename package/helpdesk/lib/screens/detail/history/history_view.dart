import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpdesk/model/histories.dart';
import 'package:helpdesk/widgets/shimmer/list_shimmer.dart';
import 'package:i2iutils/helpers/hexcolor.dart';

class HistoryView extends StatelessWidget {
  const HistoryView(
    this.isLoading,
    this.controller,
    this.histories, {
    Key? key,
  }) : super(key: key);

  final List<Histories> histories;
  final bool isLoading;
  final controller;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListShimmer(3),
          )
        : histories.isEmpty
            ? const Center(child: Text('No Histories Found'))
            : ListView.builder(
                itemCount: histories.length,
                itemBuilder: (_, index) {
                  return _buildTicketItem(histories[index]);
                });
  }

  _buildTicketItem(Histories history) {
    return Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
              color: HexColor(history.colorcode.split('-')[1]), width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBadge(
                    HexColor(history.colorcode.split('-')[1]), history.status),
                Text(
                  '${history.statusDate} ${history.statusTime}',
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: history.description.isEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          history.description,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
                !GetUtils.isURL(history.imagelink)
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () {
                          controller.open(history.imagelink);
                        },
                        child: CachedNetworkImage(
                          imageUrl: history.imagelink,
                          height: 50,
                          errorWidget: (_, __, ___) {
                            return Image.asset(
                              'assets/placeholder.png',
                              height: 50,
                            );
                          },
                        ),
                      ),
              ],
            )
          ],
        ));
  }

  _buildBadge(Color color, String text) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
