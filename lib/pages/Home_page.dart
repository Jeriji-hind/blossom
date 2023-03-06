import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/cubit/States.dart';
import 'package:project1/main.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> with TickerProviderStateMixin {
  var images = {
    "tulip.jpg": "Tulips",
    "jasmine.jpg": "Jasmines",
    "orchid.jpg": "Orchids"
  };
  var collections = {
    "1.png": "Christmas",
    "2.png": "Valentine",
    "3.png": "New Year",
    "4.png": "Black Friday",
  };
  var bouquets = {
    "bouquet1.jpg": "b1",
    "bouquet2.jpg": "b2",
    "bouquet3.jpg": "b3"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<Cubits, States>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 25),
                  child: Row(children: [
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/logo.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  ]),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Large_text(
                    text: "Newest collection",
                    color: Color(0xff411357),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                          indication_point(color: Colors.black, radius: 6),
                      tabs: [
                        Tab(text: "Flowers"),
                        Tab(text: "Bouquets"),
                        Tab(text: "Offers"),
                      ]),
                )),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<Cubits>(context).detailsPage();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 150,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/img/" +
                                          images.keys.elementAt(index)))),
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<Cubits>(context).detail_bouquet();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 150,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/img/" +
                                          bouquets.keys.elementAt(index)))),
                            ),
                          );
                        }),
                    Container(
                        child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 150,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/img/offer.png"))),
                    )),
                  ]),
                ),
                SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Large_text(
                        text: "Claim coupons",
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("assets/img/" +
                                            collections.keys.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Normal_Text(
                                    text: collections.values.elementAt(index),
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ]);
        } else {
          return Container();
        }
      },
    ));
  }
}

class indication_point extends Decoration {
  final Color color;
  double radius;
  indication_point({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return pointpainter(color: color, radius: radius);
  }
}

class pointpainter extends BoxPainter {
  final Color color;
  double radius;
  pointpainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleoffset, radius, paint);
  }
}
