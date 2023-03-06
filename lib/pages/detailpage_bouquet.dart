import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/pages/Home_page.dart';
import 'package:project1/pages/Home_page.dart';
import 'package:project1/pages/order.dart';
import 'package:project1/widgets/App.dart';
import 'package:project1/widgets/Buttons.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

import '../../cubit/States.dart';

class Details_bouquet extends StatefulWidget {
  const Details_bouquet({Key? key}) : super(key: key);

  @override
  State<Details_bouquet> createState() => _Details_bouquetState();
}

class _Details_bouquetState extends State<Details_bouquet> {
  int stars = 4;
  int selectedindex = -1;
  int _count = 0;
  void _incremntcount() {
    setState(() {
      _count++;
    });
  }

  void _decrementcount() {
    if (_count < 1) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits, States>(builder: (context, state) {
      Detail_bouquetState detail = state as Detail_bouquetState;
      return Scaffold(
          body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/bouquet1.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 800,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Large_text(
                            text: 'Wedding Bouquet',
                            color: Colors.black,
                          ),
                          Large_text(
                            text: "80 Dinars",
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Normal_Text(
                            text: 'Boutique "La Rose", Hammem Sousse',
                            size: 13,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: stars > index
                                      ? Color(0xff94146C)
                                      : Colors.grey);
                            }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Normal_Text(text: "(4.0)"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Normal_Text(
                        text: 'Description',
                        size: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Normal_Text(
                        text:
                            'A bouquet that is created by stunning flowers can be the perfect gift that can draw the eyes and fill everyone s heart with magical aroma.',
                        size: 14,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 15,
                      ),
                      Normal_Text(
                        text: "Quantity",
                        size: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xffDA93C7),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _incremntcount();
                            },
                          ),
                          Text('${_count}'),
                          FloatingActionButton(
                            backgroundColor: Color(0xffDA93C7),
                            onPressed: () {
                              _decrementcount();
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<Cubits>(context).gohome();
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Return',
                            style: TextStyle(
                                color: Color(0xff94146C),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<Cubits>(context).orderState();
                      },
                      child: Container(
                        height: 50,
                        width: 270,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff94146C)),
                        child: Center(
                          child: Text(
                            'Place your order',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ));
    });
  }
}
