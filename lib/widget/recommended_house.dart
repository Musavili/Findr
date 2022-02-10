import 'package:flutter/material.dart';
import 'package:flutter_app/widget/circle_icon_button.dart';
import 'package:flutter_app/model/house.dart';
import '../model/house.dart';
import '../screen/details/detail.dart';

class RecommendedHouse extends StatelessWidget {
  //const RecommendedHouse({Key? key}) : super(key: key);

  final recommendedList = House.generateRecommend();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              // Navigator.of(context,).push(MaterialPageRoute(builder: context(){
              //       return DetailPage(house: recommendedList[index]);
              //     }
              //     )
              // );

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return DetailPage(house: recommendedList[index]);
              }));
            },
            child: Container(
              height: 300,
              width: 230,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(recommendedList[index].imageUrl),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),

                  Positioned(
                    right: 15,
                    top: 15,
                    child: CircleIconButton(
                      iconUrl: 'assets/icons/mark.svg',
                      color: Theme.of(context).accentColor,
                    )
                  ),

                  Positioned(
                    bottom : 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white54,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recommendedList[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 5),

                              Text(
                                recommendedList[index].address,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          // Positioned(
                          //     child: CircleIconButton(
                          //         iconUrl: 'assets/icons/heart.svg',
                          //         color: Theme.of(context).accentColor
                          //     )
                          // ),

                        ],
                      ),
                    )
                  )
                ],
              )
            ),
          ),
          separatorBuilder: (_, index)=> SizedBox(width: 20),
          itemCount: recommendedList.length),
    );
  }
}
