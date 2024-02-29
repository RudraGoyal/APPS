import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main()=> runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY FIRST APP'),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: RaisedButton.icon(
          onPressed: (){},
          color: Colors.red,
            icon: Icon(
              Icons.message,
            ),
          label: Text('Message...'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text(
            'click',
          style: TextStyle(
             color: Colors.red,
            backgroundColor: Colors.white,
        ),
        ),
      ),
    );

  }
}

