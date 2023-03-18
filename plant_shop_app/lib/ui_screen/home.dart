import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:plant_shop_app/ui_screen/hometabs/trees.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Trees'),
    const Tab(text: 'Extronic Plants'),
    const Tab(text: 'Succulents'),
    const Tab(text: 'Cactus Vraties'),
  ];

  final List<String> images = [
    'https://images.pexels.com/photos/305827/pexels-photo-305827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1974508/pexels-photo-1974508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    // 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwatchandlearn.scholastic.com%2Fvideos%2Fanimals-and-plants%2Fplants%2Fwhat-are-plants.html&psig=AOvVaw07gkWtGQowX0_Ep8cj0AcJ&ust=1679048710828000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCNi3vOed4P0CFQAAAAAdAAAAABAZ'
  ];

  TabController? _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: myTabs.length, vsync: this, initialIndex: _selectedIndex);

    _tabController?.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });

      print("Selected Index: ${_tabController!.index}");
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height / 0.5,
          // color: Color.fromRGBO(68, 138, 255, 1),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [card((Icons.menu)), card((Icons.search))],
                ),
                text('Popular'),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5.0,
                  width: MediaQuery.of(context).size.width / 1.0,
                  // color: Colors.amber,
                  child: CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        child: Center(
                            child: Image.network(images[index],
                                fit: BoxFit.cover, width: 1000)),
                      );
                    },
                  ),
                ),
                text('Plants'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 1.9,
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.black,
                            indicatorWeight: 2.0,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              selectedPlants('Trees'),
                              selectedPlants('Extronic Plants'),
                              selectedPlants('Succulents'),
                              selectedPlants('Cactus Vraties'),
                              // tabs: myTabs,
                            ]),
                        const Divider(
                          thickness: 1,
                          color: Colors.transparent,
                          endIndent: 20,
                          indent: 20,
                        ),
                        Expanded(
                            child: TabBarView(controller: _tabController,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                              Trees(),
                              Trees(),
                              Trees(),
                              Trees(),
                            ])),
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  selectedPlants(
    text,
  ) {
    return GestureDetector(
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
              // border: OutlinedBorder(side: OutlinedBorder.lerp(a, b, t)),
              borderRadius: BorderRadius.circular(2),
              color: Colors.green),
          child: Center(
              child: Text(text,
                  style: TextStyle(fontSize: 10, color: Colors.white))),
        ),
        onTap: (() {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => function,
          //     ));
        }));
  }

  card(icon) {
    return Card(
      elevation: 6,
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }

  text(text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  slider(img, name, price) {
    TextStyle style1 = const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle(
        fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold);
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

        //set border radius more than 50% of height and width to make circle
      ),
      child: Column(
        children: [
          Image.asset(
            img,
            height: 90,
            width: 140,
          ),
          Text(name, style: style1),
          Text(price, style: style2),
        ],
      ),
    );
  }
}
