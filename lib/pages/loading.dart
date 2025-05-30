import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*  void getTime() async {
    var url = Uri.parse('https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLjQVOcTH0OSo8i_0VXfKAo9voQ_cfHm9gD5AOIiROUT9eVR_t9NE7SFlQPz6d5nHNZ58C5WRlxsP_K0H_1Xn4tG8hEec1B6EKD-47PY-iciQgc9ORmelfzvT5kBZFr0nmGd8E3N24_dgpL32WfVDqIjJhqxzJsOpwltmp6jaTpeP_jgiHjslx0isrIjg8ZEUGjSqIB4RoMyWNX4daNYPbTYy6Wo7gaOk6sAmYkg5WGqd6giJkeoQpn11P5Eo9dkwLgmg2r6&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk');
    http.Response response = await http.get(url);
    Map data =  jsonDecode(response.body);
    print('$data');

  }*/

  /*  void getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    http.Response response = await http.get(url);
    Map data =  jsonDecode(response.body);
    print(data);
    print(data['title']);
  }*/
  String time = 'loading';

  void setUpWordTime() async {
    WorldTime instance = WorldTime(
      location: "Berlin",
      flag: 'germany.png',
      url: 'Europe/Berlin',
    );
    await instance.getTime();
    // Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      },
    );
    /*print(instance.time);
  setState(() {
    time = instance.time;
  });*/
  }

  @override
  void initState() {
    super.initState();
    setUpWordTime();
    // getTime();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(50.0), child: Text(time)),
    );
  }
}
