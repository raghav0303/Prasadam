import 'package:prasadam/model/pick_model/pickItemModel.dart';

class PandaPickHelper {

  static var statusList = [
    PandaPickItemModel( name: 'Dal Roti Sabji', deliveryPrice: '40', remaingTime: '30 min', image: "assets/images/dal_roti_sabji.jpg", ratting: '4.8', subTitle: 'Shivam Mess', totalRating: '1.2k'),
    PandaPickItemModel( name: 'Chane Chawal', deliveryPrice: '30', remaingTime: '25 min', image : "assets/images/chole_chawal.jpg", ratting: '4.2' , subTitle : 'Krishna Mess', totalRating: '230'),
    PandaPickItemModel( name: 'Kadhai Pudi ', deliveryPrice: '50', remaingTime: '20 min', image : "assets/images/pudi_aloo.jpg", ratting: '2.5' , subTitle :"Maa Annapurna Mess", totalRating: '400'),

  ];

  static PandaPickItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;

}