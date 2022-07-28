// child: Wrap(children: [Card(
// color: ThemeColors.white,
// elevation: 8,
// margin: const EdgeInsets.all(8),
// child: Wrap(children: [Column(
// children: [
// FadeInImage.memoryNetwork(
// image: "https://${product.imageUrl}",
// width: 120,
// height: 120,
// placeholder: kTransparentImage,
// imageErrorBuilder:
// (context, error, stackTrace) {
// return Image.asset(
// 'assets/images/flag_placeholder.jpg',
// width: 120,
// height: 120,
// fit: BoxFit.fitWidth);
// },
// fit: BoxFit.fitHeight,
// ),
// Text(product.name.toString()),
// Text(product.price!.current!.text.toString()),
// ],
// )],),
// )],));