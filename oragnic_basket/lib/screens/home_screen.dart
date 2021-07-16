import 'package:flutter/material.dart';
import 'package:oragnic_basket/widgets/category_item.dart';
import '../constant.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  Widget buildPopularDeals(mq) {
    return Container(
      padding: EdgeInsets.all(10),
      height: mq.height * 0.29,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popluar Deals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ))
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(top: 6),
            height: mq.height * 0.17,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Data.popularDeals.length,
              itemBuilder: (ctx, index) => Data.popularDeals[index],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOffer(mq) {
    return Container(
      height: mq.height * 0.185,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Data.offers.length,
        itemBuilder: (ctx, index) => Data.offers[index],
      ),
    );
  }

  Widget buildCategoryContainer(Size mq, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: mq.height * 0.29,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('./categories_screen');
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ))
            ],
          ),
          Divider(
            color: Colors.grey[200],
          ),
          Container(
            padding: EdgeInsets.only(top: 6),
            height: mq.height * 0.17,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Data.categories.length,
              itemBuilder: (ctx, index) => CategoryItem(
                title: Data.categories[index].title,
                productModel: Data.categories[index].productModels,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildSearchBox() {
    return Container(
      height: 60,
      margin: EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 35),
            border: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Hey!\nLet\'s search your fresh food'),
          ),
          centerTitle: false,
          actions: [
            // Container(
            //   child: Image.network('https://t3.ftcdn.net/jpg/02/33/46/24/360_F_233462402_Fx1yke4ng4GA8TJikJZoiATrkncvW6Ib.jpg'),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/33/46/24/360_F_233462402_Fx1yke4ng4GA8TJikJZoiATrkncvW6Ib.jpg'),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BuildSearchBox(),
              Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                //height: mq.height,
                child: Column(
                  children: [
                    buildCategoryContainer(mq, context),
                    SizedBox(
                      height: 10,
                    ),
                    buildOffer(mq),
                    SizedBox(
                      height: 10,
                    ),
                    buildPopularDeals(mq),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
