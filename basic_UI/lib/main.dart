import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main()=>runApp(MaterialApp(
    home: profile(),
    ));



class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool c= true,d =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
            'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 120.0,),
      CircleAvatar(
        backgroundImage: AssetImage('assets/dog-2.jpg'),
        radius: 90.0,
      ),
      Divider(
        height: 30.0,
        color: Colors.grey[600],
      ),
      SizedBox(height: 30.0),
      Container(
        child: Text(
            'Mr. Chihuahua',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
        ),
      ),
      SizedBox(height: 30.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              child: RaisedButton.icon(
                  onPressed: (){
                    setState(() {
                      c=!c;
                    });
                    showDialog(context: context, builder: (BuildContext context){
                      return followDialog(c);
                    });
                  },
                  icon: Icon(Icons.add_link),
                  label: Text(
                   c?'Follow':'Following....',
                  ),
                color: Colors.cyan,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
          child: Container(
            child: RaisedButton.icon(
                onPressed: (){
                  setState(() {
                    d=!d;});
                  showDialog(context: context, builder: (BuildContext context){
                    return addDialog(d);
                  });

                  },
                icon: Icon(
                    d ? Icons.plus_one:Icons.delete,
                ),
                label: Text(
                    d?'Add':'Remove',
                ),
              color: Colors.cyan,
            ),
          ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      Container(
        child: RaisedButton.icon(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => message()),
            );
          },
          icon: Icon(Icons.message),
          label: Text('Message...'),
          color: Colors.cyan,
        ),
      ),
    ]
      ),
    );
  }
}

class addDialog extends StatelessWidget {bool d;
addDialog(this.d) : super();

@override
Widget build(BuildContext context) {
  return AlertDialog(
    title: Text('Alert'),
    content: Text(
      !d ? 'User added succesfully':'User Removed',
    ),
    actions: <Widget>[
      // usually buttons at the bottom of the dialog
      new FlatButton(
        child: new Text("Okay"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
}



class message extends StatelessWidget {
  const message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
            'MESSAGE',
                style: TextStyle(
            fontWeight: FontWeight.bold,
                  fontSize: 22.0,
        ),
        ),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(
                  Icons.call,
                color: Colors.cyan,
              ),
              label: Text(''),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[800],
          shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(60.0),
        ),
        ),
          ),
          ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.video_call,color: Colors.cyan,),
              label: Text(''),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[800],
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),)
            ),
          )
        ],
      ),
      body:
       Align(
            alignment: FractionalOffset.bottomLeft,
             child : RaisedButton(
              onPressed: (){},
              padding: EdgeInsets.only(right: 140.0,left: 15.0,top: 20.0,bottom: 20.0),
              child: Text(
                'Type your message here...',
                style: TextStyle(),
              ),
            )
            ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){},
          child: Icon(Icons.send,color: Colors.cyan,),
          backgroundColor: Colors.grey[800],
    )
    );
  }
}


class followDialog extends StatelessWidget {bool c;
followDialog(this.c) : super();

@override
Widget build(BuildContext context) {
  return AlertDialog(
    title: Text('Alert'),
    content: Text(
      !c ? 'Followed Mr. Chihuahua':'Unfollowed Mr. Chihuahua',
    ),
    actions: <Widget>[
      // usually buttons at the bottom of the dialog
      new FlatButton(
        child: new Text("Okay"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
}


