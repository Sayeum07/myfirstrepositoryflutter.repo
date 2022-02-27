import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Nike", "Adidas", "Vans", "Puma", "Reebok"];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E Shop",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 34.0,
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 34.0,
          ),
          SizedBox(width: 16.0),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 48.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildcategory(index);
              }),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return itemcard();
                }),
          ),
        ),
      ]),
    );
  }

  Widget buildcategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print(index);
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: _selectedIndex == index ? kTextColor : kTextLightColor,
              )),
          Container(
            margin: EdgeInsets.only(top: kDefaultPaddin / 4),
            height: 2.0,
            width: 48,
            color: _selectedIndex == index ? kTextColor : kTextLightColor,
          )
        ]),
      ),
    );
  }

  Widget itemcard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 180,
            width: 150,
            child: Image.asset("assets/nike shoes..jpg"),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("\$ 100",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )),
        )
      ],
    );
  }
}
