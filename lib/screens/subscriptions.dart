import 'package:flutter/material.dart';
import 'package:prasadam/screens/home_screen.dart';
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


class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  bool? breakfast = false;
  bool? lunch = false;
  bool? dinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .18,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        const Image(
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            // image: NetworkImage('https://cdn.pixabay.com/photo/2021/01/16/09/05/meal-5921491_960_720.jpg')),
                            image: AssetImage('assets/images/food_delivery1.jpg')
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('Food delivery' , style: TextStyle(color: Colors.black , fontFamily: Bold, fontSize: 18 ),),
                                  // Text('Order from your faviruite mess' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: BoxDecoration(
                            color: Color(0xfffed271),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/images/mess_mart.jpg'),
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 0,
                                  child: Text('Mess Mart' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),)),
                              // Positioned(
                              //     bottom: 0,
                              //     left: 0,
                              //     child: Text('panda20 for 20% off' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  ))),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffef9fc4),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/pick_up.png')

                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Pick-Up' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),),
                                  // Text('Upto 50% off' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xff85bfff),
                                borderRadius: BorderRadius.circular(10),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  const Image(
                                      fit: BoxFit.fitWidth,
                                      width: double.infinity,
                                      image: AssetImage('assets/images/everyday_essentials1.jpeg')
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Everyday Essentials' , style: TextStyle(color: blackColor , fontFamily: Bold, fontSize: 18 ),),
                                      // Text('Everyday essentials' , style: TextStyle(color: blackColor , fontWeight: FontWeight.w500 ,height:1 , fontFamily: Medium, fontSize: 14  )),

                                    ],
                                  ),
                                ],
                              )
                            ),

                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
