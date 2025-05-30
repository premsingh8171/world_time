import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =  data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background image
    String bgImage= data['isDayTime'] ? 'img3.jpg' : 'img3.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                  dynamic result =  await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                  ),
                  label: Text("Edit Location",
                    style: TextStyle(
                      color: Colors.white, // 👈 Change to your desired color
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center, // 👈 Center vertically
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(width: 20.0), // 👈 Horizontal spacing
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white,

                        ),
                      ),
                    ],
                  ),
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
