import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickbuy/models/responses/ProductsResponse.dart';
import 'package:transparent_image/transparent_image.dart';

import '../networks/api_client.dart';
import '../styles/TextStyles.dart';
import '../styles/ThemeColors.dart';

String apiKey = "7cd3cf3d34msh70137379717ab8dp127d88jsnf617cfcf851f";
String appId = "asos2.p.rapidapi.com";
String store = "US";
int offset = 0;
int categoryId = 19953;
int limit = 6;

FutureBuilder<ProductsResponse> _getProducts(BuildContext context) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<ProductsResponse>(

    future: client.getProducts(apiKey, appId, store, offset, categoryId, limit),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final ProductsResponse? todayData = snapshot.data;
        return _showGrids(context, todayData);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _showGrids(BuildContext context, ProductsResponse? productsResponse) {
  List<Products>? list = productsResponse!.products;
  var size = MediaQuery.of(context).size;

  /*24 is for notification bar on Android*/
  final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  final double itemWidth = size.width / 2;
  return Container(
    color: ThemeColors.whiteLite,
    child: Expanded(child: GridView.count(
        crossAxisCount: 3,
       shrinkWrap: false,
        childAspectRatio: 0.5,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: list!.map((Products product) {
          return GridTile(
              child: Card(
                color: ThemeColors.whiteLite,
                elevation: 8,
                margin: EdgeInsets.all(8),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(child: FadeInImage.memoryNetwork(
                        image: "https://${product.imageUrl}",
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
                      ),),
                      SizedBox(child: Text(product.name.toString(), style: landingProductText(),),),
                      SizedBox(child: Text(product.price!.current!.text.toString(), style: landingProductText(),),),
                    ],
                  ),
                ),
              ));
        }).toList()),),
  );
}

Widget _showProducts(BuildContext context, ProductsResponse? productsResponse) {
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
        child: Card(
          color: ThemeColors.white,
          elevation: 8,
          margin: EdgeInsets.all(8),
          child: Wrap(children: [Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                FadeInImage.memoryNetwork(
                  image: "https://${list[index].imageUrl}",
                  width: 120,
                  height: 120,
                  placeholder: kTransparentImage,
                  imageErrorBuilder:
                      (context, error, stackTrace) {
                    return Image.asset(
                        'assets/images/flag_placeholder.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.fitWidth);
                  },
                  fit: BoxFit.fitHeight,
                ),
                Text(list[index].name.toString()),
                Text(list[index].price!.current!.text.toString()),
              ],
            ),
          )],),
        ),
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
      body: Container(
        child: _getProducts(context),
      ),
    );
  }

}