import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/Large_text.dart';
import 'package:project1/widgets/Normal_Text.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
                child: Large_text(text: 'Discover', color: Color(0xff411357))),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffB4BCFC),
              ),
              child: Row(
                children: [
                  Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/img/lilacs.jpg'),
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    child: Normal_Text(
                        text:
                            'Lilac plants are deciduous, with deep green leaves arranged oppositely along the stems'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffB4BCFC),
              ),
              child: Row(
                children: [
                  Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/img/jasmines.jpg'),
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 130,
                    child: Normal_Text(
                        text:
                            'Jasmin,the combination of feminine sweetness and masculine wildness make the smell of jasmine universally attractive.'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffB4BCFC),
              ),
              child: Row(
                children: [
                  Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/img/tulips.jpg'),
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 130,
                    child: Normal_Text(
                        text:
                            'Tulips are erect flowers with long, broad, parallel-veined leaves and a cup-shaped, single or double flower at the tip of the stem.'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffB4BCFC),
              ),
              child: Row(
                children: [
                  Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/img/roses.jpg'),
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                    height: 130,
                    child: Normal_Text(
                        text:
                            'Roses are considered as timeless gifts of love. They make special occasions memorable with their presence and their lingering fragrance'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
