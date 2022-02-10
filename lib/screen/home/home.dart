import 'package:flutter/material.dart';
import 'package:flutter_app/widget/best_offer.dart';
import 'package:flutter_app/widget/categories.dart';
import 'package:flutter_app/widget/recommended_house.dart';

import '../../widget/custom_app_bar.dart';
import '../../widget/custom_bottom_nav_bar.dart';
import '../../widget/search_input.dart';
import '../../widget/welcome_text.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            SearchInput(),
            Categories(),
            SizedBox(height: 20,),
            RecommendedHouse(),
            BestOffer(),
        ],),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}