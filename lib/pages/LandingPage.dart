import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickbuy/constants/Category.dart';
import 'package:quickbuy/models/responses/ProductsResponse.dart';
import 'package:quickbuy/pages/DetailsPage.dart';
import 'package:transparent_image/transparent_image.dart';

import '../networks/api_client.dart';
import '../styles/TextStyles.dart';
import '../styles/ThemeColors.dart';

String apiKey = "aff0b3060fmsh341831e529ad917p1b0755jsnc95fe6726c71";
String appId = "asos2.p.rapidapi.com";
String store = "US";
int offset = 0;
// int categoryId = 19953;
int limit = 6;


FutureBuilder<ProductsResponse> _getProducts(BuildContext context, int categoryId, int uiId) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<ProductsResponse>(

    future: client.getProducts(apiKey, appId, store, offset, categoryId, limit),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final ProductsResponse? productData = snapshot.data;

        if(uiId == 1){
          return _showProductGrids(context, productData, productData!.categoryName.toString());
        }
        else if(uiId == 2){
          return _showHorizontalProducts(context, productData, productData!.categoryName.toString());
        }
        else if(uiId == 3){
          return _showCarousalProduct(context, productData, productData!.categoryName.toString());
        }
        else {
          return _showProductGrids(context, productData, productData!.categoryName.toString());
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _showProductGrids(BuildContext context, ProductsResponse? productsResponse, String title) {
  List<Products>? list = productsResponse!.products;
  var size = MediaQuery.of(context).size;

  /*24 is for notification bar on Android*/
  // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  // final double itemWidth = size.width / 2;

  double cardWidth = MediaQuery.of(context).size.width / 3.3;
  double cardHeight = MediaQuery.of(context).size.height / 3.6;

  final double itemHeight = (size.height) / 2;
  final double itemWidth = size.width / 2;

  return Container(
    color: ThemeColors.whiteLite,
    margin: const EdgeInsets.all(8.0),
    child: Wrap(children: [
      Card(color: Colors.white, elevation: 8.0, child: Column(children: [
        const SizedBox(height: 10,),
        Row(children: [
          const SizedBox(width: 8,),
          Expanded(child: Text(title, textAlign: TextAlign.start, style: categoryTextStyle(),),),
          const Icon(Icons.view_agenda_outlined, color: Colors.black,)
        ],),
        const SizedBox(height: 10,),
        GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: list!.map((Products product) {
              return GridTile(
                  child: InkWell(onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(title: "Details", id: product.id, initialCount: 0,)),
                  );} ,child: Card(
                    color: ThemeColors.whiteLite,
                    elevation: 8,
                    child: SizedBox(
                      child: Column(
                        children: [
                          SizedBox(child: FadeInImage.memoryNetwork(
                            image: "https://${product.imageUrl}",
                            height: 70,
                            width: 70,
                            placeholder: kTransparentImage,
                            imageErrorBuilder:
                                (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/flag_placeholder.jpg',
                                height: 70,
                                width: 70,
                                // fit: BoxFit.fitWidth
                              );
                            },
                            // fit: BoxFit.fitHeight,
                          ),),
                          Expanded(child: Text(product.name.toString(), maxLines: 1, textAlign: TextAlign.center, style: landingProductText(),),),
                          Expanded(child: Text(product.price!.current!.text.toString(), style: landingProductText(),),),
                        ],
                      ),
                    ),
                  ),));
            }).toList()),
      ],),)
    ],),
  );
}

Widget _showHorizontalProducts(BuildContext context, ProductsResponse? productsResponse, String title) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Appetizer',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          ),
        ],
      ));
}

Widget _showCarousalProduct(BuildContext context, ProductsResponse? productsResponse, String title) {
  List<Products>? list = productsResponse!.products;
  return Container(margin: EdgeInsets.all(8), child: Column(children: [
    const SizedBox(height: 10,),
    Row(children: [
      const SizedBox(width: 8,),
      Expanded(child: Text("Today Deals", textAlign: TextAlign.start, style: categoryTextStyle(),),),
      const Icon(Icons.view_agenda_outlined, color: Colors.black,)
    ],),
    const SizedBox(height: 10,),
    CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        height: 100,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        // disableCenter: true,
        // viewportFraction: 1,
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
      ),
      items: list?.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsPage(title: "Details", id: i.id, initialCount: 0,)),
            );}, child: Card(color: ThemeColors.whiteLite, elevation: 8, child: Row(children: [
              FadeInImage.memoryNetwork(
                image: "https://${i.imageUrl}",
                height: 100,
                width: 100,
                placeholder: kTransparentImage,
                imageErrorBuilder:
                    (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/flag_placeholder.jpg',
                    height: 100,
                    width: 100,
                    // fit: BoxFit.fitWidth
                  );
                },
                // fit: BoxFit.fitHeight,
              ),
              Expanded(child: Center(child: Column(children: [
                Row(children: [Expanded(child: Text(i.name.toString(), maxLines: 2, textAlign: TextAlign.start, style: salesProductText(),))],),
                Row(children: [Expanded(child: Text(i.price!.current!.text.toString(),  textAlign: TextAlign.start, style: currentPriceText(),))],),
                Row(children: [Expanded(child: Text(i.price!.rrp!.text.toString(),  textAlign: TextAlign.start, style: previousPriceText(),))],),
              ],),))
            ],),),);
          },
        );
      }).toList(),
    ),
  ],),);
}

Widget _showProducts(BuildContext context, ProductsResponse? productsResponse, String title) {
  List<Products>? list = productsResponse!.products;
  return ListView.builder(
    itemCount: list!.length,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ArticlePage(article: list![index],)),
          // );
        },
        child: Card(color: Colors.white, elevation: 8, child: Row(children: [
          FadeInImage.memoryNetwork(
            image: "https://${list[index].imageUrl}",
            height: 80,
            width: 80,
            placeholder: kTransparentImage,
            imageErrorBuilder:
                (context, error, stackTrace) {
              return Image.asset(
                'assets/images/flag_placeholder.jpg',
                height: 80,
                width: 80,
                // fit: BoxFit.fitWidth
              );
            },
            // fit: BoxFit.fitHeight,
          ),
          Expanded(child: Column(children: [
            Expanded(child: Text(list[index].name.toString(), maxLines: 1, textAlign: TextAlign.start, style: landingProductText(),),),
            Expanded(child: Text(list[index].price!.current!.text.toString(), style: landingProductText(),),),
          ],))
        ],),),
      );
    },
  );
}

class LandingPage extends StatefulWidget{
  const LandingPage({Key? key, this.title}) : super(key: key);
  final title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(child: Column(children: [
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE, 3),
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE_SHIRT, 1),
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE_PANTS, 1),
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE_SHOES, 1),
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE_SHADES, 1),
        const SizedBox(height: 20,),
        _getProducts(context, CategoryCodes.SALE_FACE_BODY, 1),
      ],),),
    );
  }
}

showDetails(int? id, BuildContext context) {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => DetailsPage(id: id,)),
  // );
}