import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickbuy/constants/Category.dart';

import '../constants/Categry.dart';
import '../styles/TextStyles.dart';
import '../styles/ThemeColors.dart';
import 'DetailsPage.dart';

List<Categry> catList = [];


// Widget _showCategoryGrids(BuildContext context, List<Categry> list) {
//   var size = MediaQuery.of(context).size;
//
//   /*24 is for notification bar on Android*/
//   // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//   // final double itemWidth = size.width / 2;
//
//   double cardWidth = MediaQuery.of(context).size.width / 3.3;
//   double cardHeight = MediaQuery.of(context).size.height / 3.6;
//
//   final double itemHeight = (size.height) / 2;
//   final double itemWidth = size.width / 2;
//
//   return Container(
//     color: ThemeColors.whiteLite,
//     margin: const EdgeInsets.all(8.0),
//     child: Wrap(children: [
//       Card(color: Colors.white, elevation: 8.0, child: Column(children: [
//         const SizedBox(height: 10,),
//         Row(children: [
//           const SizedBox(width: 8,),
//           Expanded(child: Text("Categories", textAlign: TextAlign.start, style: categoryTextStyle(),),),
//           const Icon(Icons.view_agenda_outlined, color: Colors.black,)
//         ],),
//         const SizedBox(height: 10,),
//         GridView.count(
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             childAspectRatio: 1,
//             padding: const EdgeInsets.all(4.0),
//             mainAxisSpacing: 2.0,
//             crossAxisSpacing: 2.0,
//             children: list.map((Categry product) {
//               return GridTile(
//                   child: InkWell(onTap: () {Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DetailsPage(title: "Details", id: product.id, initialCount: 0,)),
//                   );} ,child: Card(
//                     color: ThemeColors.whiteLite,
//                     elevation: 8,
//                     child: SizedBox(
//                       height: 100,
//                       width: double.infinity,
//                       child: Stack(
//                         children: [
//                           SizedBox(child: Image.asset(
//                             product.image,
//                             height: 100,
//                             width: 100,
//                             // fit: BoxFit.fitWidth
//                           ),),
//                           Expanded(child: Text(product.title.toString(), maxLines: 1, textAlign: TextAlign.start, style: landingProductText(),),),
//                           // Expanded(child: Text(product.price!.current!.text.toString(), style: landingProductText(),),),
//                         ],
//                       ),
//                     ),
//                   ),));
//             }).toList()),
//       ],),)
//     ],),
//   );
// }

ListView _buildCategoryList(BuildContext context, List<Categry> list) {
  return ListView.builder(
    itemCount: list.length,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ArticlePage(article: list![index],)),
          // );
        },
        child: Card(
          color: Colors.white,
          elevation: 8,
          margin: EdgeInsets.all(16),
          child: Stack(
            children: [
              Expanded(child: Image.asset(
                  list[index].image,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.fitWidth)),
              const SizedBox(
                width: 8,
              ),
              Text(list[index].title.toString(), style: categoryListTextStyle(),),
            ],
          ),
        ),
      );
    },
  );
}

class CategoryPage extends StatefulWidget{
  const CategoryPage({Key? key, this.title}) : super(key: key);

  final title;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    catList.add(Categry(title: "Shirt", image: "assets/images/shirt.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "T-Shirt", image: "assets/images/t_shirt.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Pants", image: "assets/images/pants.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Polo", image: "assets/images/polo.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Shoes", image: "assets/images/shoe.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Shades", image: "assets/images/shades.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Bags", image: "assets/images/bags.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Jacket", image: "assets/images/jacket.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Cosmetics", image: "assets/images/cosmetics.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Hoodie", image: "assets/images/hoodie.png", id: CategoryCodes.SALE_SHIRT));
    catList.add(Categry(title: "Jewellery", image: "assets/images/jwellery.png", id: CategoryCodes.SALE_SHIRT));
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(
        child: Column(children: [
          _buildCategoryList(context, catList),
        ],),
      ),
    );
  }

}