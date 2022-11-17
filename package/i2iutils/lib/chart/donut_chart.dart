import 'package:flutter/material.dart';
import 'package:i2iutils/helpers/hexcolor.dart';

class DonutChart extends StatelessWidget {

  List values;
  double greenValue=0;
  DonutChart({Key? key, required this.values,required this.greenValue}) : super(key: key);

  var boxShadow = [
    const BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 1),
    const BoxShadow(color: Colors.white, spreadRadius: 3, blurRadius: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 220,
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: boxShadow),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: boxShadow,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.red,
                      strokeWidth: 30,
                      value: greenValue,
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle,boxShadow: boxShadow),
                    child: const Center(
                      child: Text(
                        'Over All',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               _buildDash('171D36', values[0]),
               _buildDash('FBFBFC', values[1], isBlackContainer: false),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildDash(String color,Map value,{bool isBlackContainer=true}){
    return  Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          color: HexColor(color),
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow),
      child: Row(
        children: [
          const SizedBox(
            width: 6,
          ),
          Image.asset(
            'assets/${value['imagePath']}',
            width: 15,
            color: isBlackContainer ? Colors.white : Colors.black,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value['value'],
                  style: TextStyle(
                      color: isBlackContainer ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  value['key'],
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
