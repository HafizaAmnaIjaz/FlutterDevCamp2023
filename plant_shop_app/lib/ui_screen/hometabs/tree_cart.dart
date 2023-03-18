import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_shop_app/inc/images.dart';
import 'package:plant_shop_app/ui_screen/hometabs/trees.dart';

class TreeCart extends StatefulWidget {
  const TreeCart({super.key});

  @override
  State<TreeCart> createState() => _TreeCartState();
}

class _TreeCartState extends State<TreeCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              // margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                child: Image.asset(
                  Images.takhrot,
                ),
              ),
            ),

            // color: Colors.blue,
            const SizedBox(
              height: 10,
            ),

            const Text(
              'Aloo Bukhara or Plum',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),

            const Padding(
              padding:
                  EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
              child: Text(
                  'This product (as from exotic category) is available for cash on delivery only in Lahore.'),
            ),
            types('Pot Type', 'Categories', 'Sku'),
            const SizedBox(
              height: 10,
            ),

            typesprice('12 inc', 'Trees', 'a5087'),

            SizedBox(
              height: 40,
            ),
            addCartItems(Trees()),
          ],
        )),
      ),
    );
  }

  typesprice(text1, text2, text3) {
    TextStyle style2 = TextStyle(
        color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20);
    return Container(
      //  color: Colors.lightBlue,
      margin: EdgeInsets.only(left: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: Text(
            text1,
            style: style2,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text2,
            style: style2,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text3,
            style: style2,
          ),
        ),
      ]),
    );
  }

  types(text1, text2, text3) {
    TextStyle style1 = TextStyle(color: Colors.black, fontSize: 15);
    // TextStyle style2 = TextStyle(
    //     color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20);
    return Container(
      //  color: Colors.lightBlue,
      margin: EdgeInsets.only(left: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: Text(
            text1,
            style: style1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text2,
            style: style1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text3,
            style: style1,
          ),
        ),
      ]),
    );
  }

  addCartItems(function) {
    return Container(
        // height: 100,
        margin: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height / 12.0,
        width: double.infinity,
        // color: Colors.blue,
        child: Card(
            elevation: 2,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: Text(
              'Add Cart',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))));
  }
}
