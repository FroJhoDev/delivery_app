import 'package:delivery_app_code/screens/burger_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Delivery Burger',
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 28.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: TabBar(
                  tabs: <Widget>[
                    Container(
                      height: 53.0,
                      child: Center(
                        child: Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 53.0,
                      child: Center(
                        child: Text(
                          'Create Burger',
                          style: TextStyle(
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1.32,
                decoration:
                    BoxDecoration(color: Colors.blueAccent.withOpacity(0.1)),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    _menuBody(),
                    Center(child: Text('under construction . . .')),
                  ],
                ),
              )
            ], 
          ),
        ),
      ),
    );
  }

  Widget _menuBody() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 50.0,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 25.0, left: 15.0),
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.list,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              _filterOption('Queijo'),
              _filterOption('Frango'),
              _filterOption('Peixe'),
              _filterOption('Vegetariano'),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/burger01.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen[600],
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Text(
                                'R\$ 19,99',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Text(
                              '525g',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'King Size Burger',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Pao, Chedder, Bacon, Tomate, Cebola, Queijo, Presunto e Molho da Casa',
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'OFERTAS ESPECIAIS',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 15.0),
              _burgerOffers('Cheese Burger', 19.99, 'assets/images/burger01.jpg'),
              _burgerOffers('EBQ Burger', 25.99, 'assets/images/burger02.jpg'),
              _burgerOffers('Doble Bacon', 23.59, 'assets/images/burger03.jpg'),
              _burgerOffers('Autraliano', 29.69, 'assets/images/burger04.jpg'),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cheese Burger',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Pao, Chedder, Bacon, Tomate, Cebola, Queijo, Presunto e Molho da Casa',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/burger02.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen[600],
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Text(
                                'R\$ 19,99',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Text(
                              '525g',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterOption(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 14.0),
        ),
      ),
    );
  }

  Widget _burgerOffers(String title, double price, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BurgerScreen(title: title, price: price, image: image,)));
      },
      child: Container(
        width: 170.0,
        margin: EdgeInsets.only(right: 20.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'R\$ $price',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
