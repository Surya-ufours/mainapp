import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  final int count;

  const ListShimmer(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (_, __) => Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100,
                      height: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      height: 15,
                      color: Colors.white,
                    ),
                    Container(
                      width: 80,
                      height: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 15,
                      color: Colors.white,
                    ),
                    Container(
                      width: 50,
                      height: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
