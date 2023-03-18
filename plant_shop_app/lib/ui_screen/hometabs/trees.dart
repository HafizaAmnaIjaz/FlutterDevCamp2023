import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_shop_app/inc/images.dart';
import 'package:plant_shop_app/ui_screen/hometabs/tree_cart.dart';

class Trees extends StatefulWidget {
  const Trees({super.key});

  @override
  State<Trees> createState() => _TreesState();
}

class _TreesState extends State<Trees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
              // color: Colors.pink,
              height: MediaQuery.of(context).size.height / 2.5,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: ((context, index) {
                        return slider(
                          Images.takhrot,
                          TreeCart(),
                        );
                      })))),
        ],
      ),
    ));
  }

  slider(img, function) {
    return Container(
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            elevation: 20,
            color: Color.fromARGB(255, 210, 225, 237),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

              //set border radius more than 50% of height and width to make circle
            ),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.asset(
                    img,
                    height: MediaQuery.of(context).size.height / 4.0,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 9.0,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => function)));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 13.2,
                            width: MediaQuery.of(context).size.width / 3.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Center(
                                child: Text('Add to Cart',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.library_add_check_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  addCart(img, function) {
    return Container(
        child: Card(
      elevation: 2,
      color: Color.fromARGB(255, 244, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset(
            img,
            height: 100,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => function)));
                    }),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                        //set border radius more than 50% of height and width to make circle
                      ),
                      child: Text(
                        'Add Cart',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.swipe_left_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
