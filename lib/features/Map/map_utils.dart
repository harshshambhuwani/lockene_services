
import 'package:url_launcher/url_launcher.dart';

class MapUtils{
   MapUtils._();

   static Future<void> openMap(double latitude,double longitude) async{
     // String googleMapUrl = "https://www.google.com/maps/search/?api=1&query=&query=$latitude,$longitude";
     String googleMapUrl = "http://maps.google.co.in/maps?q=$latitude,$longitude";

   if(await canLaunch(googleMapUrl)){
     await launch(googleMapUrl);

   }else{
     throw 'Please install google map application';
   }

   }
}