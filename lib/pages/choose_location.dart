import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(location: 'India1', flag: 'img3.jpg', url: 'Asia/India'),
    WorldTime(location: 'India2', flag: 'img4.jpg', url: 'Asia/India'),
    WorldTime(location: 'India3', flag: 'img3.jpg', url: 'Asia/India'),
    WorldTime(location: 'India4', flag: 'img4.jpg', url: 'Asia/India'),
    WorldTime(location: 'India5', flag: 'img3.jpg', url: 'Asia/India'),
  ];

  void updateTime(index) async{
   WorldTime instance = locations[index];
   await instance.getTime();
   // navigation to home screen
    Navigator.pop(context, {
           'location': instance.location,
           'flag': instance.flag,
           'time': instance.time,
           'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  //print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
