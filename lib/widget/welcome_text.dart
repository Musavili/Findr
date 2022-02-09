import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  //const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,//align to start
        children: [
          Text('Hello User',
            style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 10),
          Text('What are you looking for?',
            style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
