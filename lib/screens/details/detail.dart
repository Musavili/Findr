import 'package:flutter/material.dart';
import 'package:flutter_app/model/house.dart';
import 'package:flutter_app/screens/details/widget/about.dart';
import 'package:flutter_app/screens/details/widget/button.dart';
import 'package:flutter_app/screens/details/widget/content_intro.dart';
import 'package:flutter_app/screens/details/widget/detail_app_bar.dart';
import 'package:flutter_app/screens/details/widget/house_info.dart';


class DetailPage extends StatelessWidget {
  final House house;
  const DetailPage({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        DetailAppBar(house: house),
        SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CustomButton(
                label: "chat",
              ),
              CustomButton(
                label: "call",
              ),
            ]
        ),
        SizedBox(height: 20),
        ContentIntro(house: house),
        SizedBox(height: 20),
        HouseInfo(),
        SizedBox(height: 20),
        About(),
        SizedBox(height: 25),

      ],
    )));
  }
}
