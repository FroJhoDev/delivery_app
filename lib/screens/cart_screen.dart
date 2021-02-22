import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        actions: <Widget>[IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            bottom: 70.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView(
                  children: <Widget>[
                    _burgerItem(),
                    _burgerItem(),
                    _burgerItem(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColor, //Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16.0),
                              ),
                              Text(
                                'R\$ 89.99',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          Container(
                            height: 40.0,
                            child: FlatButton(
                                onPressed: () {},
                                color: Theme.of(context).accentColor,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Checkout',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor,)
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _burgerItem() {
    return Card(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                '3 x',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cheese Burger',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'More Bacon, More Cheese e Salad',
                      style: TextStyle(color: Colors.black54, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'R\$ 39.99',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'R\$ 19.99',
                    style: TextStyle(color: Colors.black54, fontSize: 14.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
