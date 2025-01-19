import 'package:flutter/material.dart';
import 'package:movie/constants/constants.dart';

class LocationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on,color: white,size: 30,),
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Legen Cinema',style: TextStyle(
                color: white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),),
              Text('ផ្សារមីតថោន, ទឺកថ្លា',style: TextStyle(
                color: white.withOpacity(0.5),
                fontSize: 16.0,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
