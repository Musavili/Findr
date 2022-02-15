import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  //final double width;

  //const CustomButton({Key? key}) : super(key: key);
  const CustomButton({Key? key, required this.label,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: Theme.of(context).primaryColor,
            ),
            child: Container(
              width: 130,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(label,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                )
            )
        )
    );
  }
}
