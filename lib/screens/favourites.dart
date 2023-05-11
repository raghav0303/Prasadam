import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: MediaQuery.of(context).size.height * .30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        const Image(
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            image: NetworkImage('https://lh3.googleusercontent.com/p/AF1QipMgYdRdBrGV3ixwbjN5FxW52Uli5gwLHHGpHxbm=s680-w680-h510'),
                            // image: AssetImage('assets/images/food_delivery.jpg')
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
                                  Text('Shivam Mess' , style: TextStyle(color: Colors.white, fontSize: 18 ),),
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

              SizedBox(
                height: 30,
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        const Image(
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          image: NetworkImage('https://img.restaurantguru.com/r4e3-Maa-Annpurna-Mess-and-Restaurant-meals.jpg'),
                          // image: AssetImage('assets/images/food_delivery.jpg')
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
                                  Text('Maa Annapurna Mess' , style: TextStyle(color: Colors.white, fontSize: 18 ),),
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

              SizedBox(
                height: 30,
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        const Image(
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          image: NetworkImage('https://content.jdmagicbox.com/comp/durg/k9/9999px788.x788.211215182418.j5k9/catalogue/ajju-punjab-tadka-mase-bhilai-sector-10-bhilai-tiffin-services-ydd8qivekm.jpg?clr='),
                          // image: AssetImage('assets/images/food_delivery.jpg')
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
                                  Text('Ajju Punjab Tadka Mess' , style: TextStyle(color: Colors.white, fontSize: 18 ),),
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

            ],
          )
        )
      )
    );
  }
}


// Expanded(
// child:Card(
// elevation: 4.0, // Sets the elevation of the card, giving it a shadow
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0), // Sets rounded corners for the card
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: <Widget>[
// Image.network(
// 'https://lh3.googleusercontent.com/p/AF1QipMgYdRdBrGV3ixwbjN5FxW52Uli5gwLHHGpHxbm=s680-w680-h510', // Replace with the URL of your image
// fit: BoxFit.cover, // Sets the image to cover the entire card
// ),
// Padding(
// padding: EdgeInsets.all(16.0),
// child: Text(
// 'Shivam Mess', // Replace with your description
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
//
// Expanded(child: Card(
// elevation: 4.0, // Sets the elevation of the card, giving it a shadow
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0), // Sets rounded corners for the card
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: <Widget>[
// Image.network(
// 'https://img.restaurantguru.com/r4e3-Maa-Annpurna-Mess-and-Restaurant-meals.jpg', // Replace with the URL of your image
// fit: BoxFit.cover, // Sets the image to cover the entire card
// ),
// Padding(
// padding: EdgeInsets.all(16.0),
// child: Text(
// 'Maa Annapurna Mess', // Replace with your description
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// ),),
//
// Expanded(child: Card(
// elevation: 4.0, // Sets the elevation of the card, giving it a shadow
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10.0), // Sets rounded corners for the card
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: <Widget>[
// Image.network(
// 'https://content.jdmagicbox.com/comp/durg/k9/9999px788.x788.211215182418.j5k9/catalogue/ajju-punjab-tadka-mase-bhilai-sector-10-bhilai-tiffin-services-ydd8qivekm.jpg?clr=', // Replace with the URL of your image
// fit: BoxFit.cover, // Sets the image to cover the entire card
// ),
// Padding(
// padding: EdgeInsets.all(16.0),
// child: Text(
// 'Ajju Punjab Tadka Mess', // Replace with your description
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ],
// ),
// ))

