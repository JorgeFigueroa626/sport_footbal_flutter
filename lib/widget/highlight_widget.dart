// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sport_football/ob/higlight_ob.dart';

class HighlightWidget extends StatelessWidget {
  HighlightWidget(this.hlob,{super.key});

  HighlightOb hlob;

 

  


  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.red,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(hlob.thumbnail!, fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.amber,
                alignment: Alignment.center,
                child: const Text(
                  'Whoops!',
                  style: TextStyle(fontSize: 30),
                ),
              );
            },
            ),
          ),
          const SizedBox(height: 10,),
          Text(hlob.title!, style: const TextStyle(fontSize: 20, color: Colors.white),),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
