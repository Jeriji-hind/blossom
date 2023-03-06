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

import '../cubit/States.dart';
import 'Home_page.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
      DetailState detail = state as DetailState;
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
                          image: AssetImage("assets/img/tulip.jpg"),
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
                            text: 'Tulip',
                            color: Colors.black,
                          ),
                          Large_text(
                            text: "15 Dinars",
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
                            'Tulips are erect flowers with long, broad, parallel-veined leaves and a cup-shaped, single or double flower at the tip of the stem.',
                        size: 14,
                      ),
                      SizedBox(height: 20),
                      Normal_Text(text: "Choose your favorite color", size: 15),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(3, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: App(
                                size: 50,
                                color: selectedindex == index
                                    ? Color.fromARGB(255, 232, 186, 237)
                                    : Colors.black,
                                backgroundColor: selectedindex == index
                                    ? Color.fromARGB(255, 116, 90, 110)
                                    : Color.fromARGB(255, 116, 75, 104),
                                borderColor: Colors.black,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
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
