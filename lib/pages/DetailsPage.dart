import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quickbuy/models/responses/ProductDetailResponse.dart';
import 'package:quickbuy/utils/CornerClipper.dart';
import 'package:transparent_image/transparent_image.dart';

import '../networks/api_client.dart';
import '../styles/TextStyles.dart';
import '../styles/ThemeColors.dart';
import 'LandingPage.dart';

FutureBuilder<ProductDetailResponse> _getProductDetails(BuildContext context, int productId) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<ProductDetailResponse>(

    future: client.getProductDetail(apiKey, appId, productId),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final ProductDetailResponse? productDetail = snapshot.data;
        return _showDetailsUi(context, productDetail);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

/*Widget _buildCounter(BuildContext context) {
  return SizedBox(
    width: 110.0,
    height: 40.0,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          // color: Color(0xddFFFFFF),
            border: Border.all(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(22.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  updateCount(-1);
                },
                child: Container(
                    width: 40.0,
                    child: Card(
                        color: Colors.white54,
                        child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            )
                        )
                    ))),
            Container(
              child: Center(
                  child: Text(
                    '$count',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
            ),
            GestureDetector(
                onTap: () {
                  updateCount(1);
                },
                child: Container(
                    width: 40.0,
                    child: Card(
                        color: Colors.white54,
                        child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            )
                        )
                    ))),
          ],
        ),
      ),
    ),
  );
}*/

Widget _showDetailsUi(BuildContext context, ProductDetailResponse? detail){
  List<Images>? list = detail!.media!.images;
  return Column(children: [
    CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        height: 300,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        disableCenter: true,
        viewportFraction: 1,
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
      ),
      items: list?.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return FadeInImage.memoryNetwork(
              image: "https://${i.url}",
              height: 300,
              width: double.infinity,
              placeholder: kTransparentImage,
              imageErrorBuilder:
                  (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/flag_placeholder.jpg',
                  height: 300,
                  width: double.infinity,
                  // fit: BoxFit.fitWidth
                );
              },
              fit: BoxFit.fitWidth,
            );
          },
        );
      }).toList(),
    ),
    Container(padding: EdgeInsets.all(8) ,child: Row(children: [Expanded(child: Text(detail.name.toString(), textAlign: TextAlign.start, style: detailTitleText(),))],),),
    Container(padding: EdgeInsets.all(8) ,child: Row(children: [Expanded(child: Html(data: detail.description.toString(),))],),),
    Container(padding: EdgeInsets.all(8) ,child: Row(children: [Expanded(child: Text("Gender: ${detail.gender}", textAlign: TextAlign.start, style: detailDescriptionText(),))],),),
    Container(padding: EdgeInsets.all(8) ,child: Row(children: [Expanded(child: Text("Brand: ${detail.brand!.name.toString()}", textAlign: TextAlign.start, style: detailDescriptionText(),))],),),
    Container(padding: EdgeInsets.all(8) ,child: Row(children: [Expanded(child: Html(data: detail.info!.aboutMe.toString(), ))],),),
  ],);
}

class DetailsPage extends StatefulWidget{
  const DetailsPage({Key? key, this.title, this.id, required this.initialCount}) : super(key: key);
  final title;
  final id;
  final int initialCount;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateCount(int addValue) {
    if (count + addValue >= 0) {
      // setState(() {
      //   count += addValue;
      // });

      count+=1;

      // if (widget.onChange != null) {
      //   widget.onChange(count);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _getProductDetails(context, widget.id),
        ],),
      ),
      bottomNavigationBar: Container(padding: EdgeInsets.all(8.0),color: Colors.black, child: Row(children: [
        SizedBox(
          width: 110.0,
          height: 40.0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                // color: Color(0xddFFFFFF),
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(22.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        updateCount(-1);
                      },
                      child: Container(
                          width: 40.0,
                          child: Card(
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  )
                              )
                          ))),
                  Container(
                    child: Center(
                        child: Text(
                          '$count',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        )),
                  ),
                  GestureDetector(
                      onTap: () {
                        updateCount(1);
                      },
                      child: Container(
                          width: 40.0,
                          child: Card(
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  )
                              )
                          ))),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8,),
        Expanded(child: Text("Add to Cart", textAlign: TextAlign.end, style: cartAddTextStyle(),)),
        SizedBox(width: 8,)
      ],),),
    );
  }

}