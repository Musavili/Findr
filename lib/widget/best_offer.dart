import 'package:flutter/material.dart';

import '../model/house.dart';

class BestOffer extends StatelessWidget {
  //const BestOffer({Key? key}) : super(key: key);

  final listOffer = House.generateBestOffer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Best offers',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Text(
                  'See all',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold)
              ),
            ],
          )
        ],
      ),
    );
  }
}
