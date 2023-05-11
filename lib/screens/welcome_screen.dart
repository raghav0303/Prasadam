import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prasadam/components/restaurant.dart';
import 'package:prasadam/constants/color.dart';
import 'package:prasadam/constants/constants.dart';
import 'package:prasadam/screens/home_new.dart';
import 'package:prasadam/model/pick_model/pickHelper.dart';
import 'package:prasadam/model/pick_model/pickItemModel.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height * 1;
    final width = MediaQuery
        .of(context)
        .size
        .width * 1;
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your daily deals' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .278,

                      child: ListView.builder(
                          itemCount: PandaPickHelper.itemCount,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                            return RestuarentScreen(
                              name: model.name,
                              image:model.image ,
                              remainingTime: model.remaingTime,
                              totalRating: model.totalRating,
                              subTitle: model.subTitle,
                              rating: model.ratting,
                              deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                            );
                          }),
                    ),
                  )
                ),
              ],
            )
          )
        )
    );
  }
}

