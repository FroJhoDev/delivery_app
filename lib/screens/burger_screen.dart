import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BurgerScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;

  BurgerScreen({this.title, this.price, this.image});

  @override
  _BurgerScreenState createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  PanelController _panelController = PanelController();

  double _total = 0.0;

  @override
  void initState() {
    super.initState();
    _total = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 15.0,
            offset: Offset(0.0, 0.0),
          )
        ],
        maxHeight: MediaQuery.of(context).size.height * 0.68,
        minHeight: 160,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Ingredients',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 40.0,
                          color: Colors.grey[300],
                        )),
                    Expanded(flex: 4, child: SizedBox())
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: double.infinity,
                  height: 45.0,
                  child: FlatButton(
                    onPressed: () {
                      _showCustomDialog(context);
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Ingredients',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 40.0,
                          color: Colors.grey[300],
                        )),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text(
                            'R\$ $_total',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    _ingredient('assets/images/alface.png', 'Alface'),
                    _ingredient('assets/images/bacon.png', 'Bacon'),
                    _ingredient('assets/images/cebola.png', 'Cebola'),
                    _ingredient('assets/images/ketchup.png', 'Ketchup'),
                    _ingredient('assets/images/queijo.png', 'Queijo'),
                    _ingredient('assets/images/tomate.png', 'Tomate'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    _additional('More Bacon', 2.50),
                    _additional('More Cheese', 2.00),
                    _additional('Salad', 3.00),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  child: FlatButton(
                    onPressed: () {
                      _showCustomDialog(context);
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: _backgroundBody(),
      ),
    );
  }

  Widget _backgroundBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.1)
                  ])),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 36.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: Icon(
                      Icons.favorite_border,
                      size: 36.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
            height: 150.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '325g',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text('R\$ ${widget.price}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _ingredient(String image, String name) {
    return Padding(
      padding: EdgeInsets.only(right: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white,
            ),
            width: 75.0,
            height: 75.0,
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
          )
        ],
      ),
    );
  }

  Widget _additional(String name, double price) {
    int _quantity = 0;

    setState(() {
      _quantity = 0;
    });

    return StatefulBuilder(
        builder: (BuildContext context, setNewState) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'R\$ $price',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (_quantity >= 1) {
                        setNewState(() {
                          _quantity = _quantity - 1;
                        });
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      _quantity.toString(),
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setNewState(() {
                        _quantity = _quantity + 1;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  void _showCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 220.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 220.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '3 Items in your cart',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Cheese Burger',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'R\$ 19.99',
                          style: TextStyle(color: Colors.black54, fontSize: 18.0),
                        ),                        
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(                      
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Okay let's go!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 5.0,
            //   right: 5.0,
            //               child: InkWell(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Icon(
            //       Icons.close,
            //       color: Theme.of(context).accentColor,
            //       size: 28.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }
}
