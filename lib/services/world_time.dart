import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // changed macros - macroses for for error
      var url = Uri.parse(
        'https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLjQVOcTH0OSo8i_0VXfKAo9voQ_cfHm9gD5AOIiROUT9eVR_t9NE7SFlQPz6d5nHNZ58C5WRlxsP_K0H_1Xn4tG8hEec1B6EKD-47PY-iciQgc9ORmelfzvT5kBZFr0nmGd8E3N24_dgpL32WfVDqIjJhqxzJsOpwltmp6jaTpeP_jgiHjslx0isrIjg8ZEUGjSqIB4RoMyWNX4daNYPbTYy6Wo7gaOk6sAmYkg5WGqd6giJkeoQpn11P5Eo9dkwLgmg2r6&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk',
      );
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);
      print('$data');

      String dayofweekName = data['dayofweekName'];
      time = dayofweekName;
      location = 'Rampur';
      flag = 'India';
    } catch (e) {
      print('caught error:$e');
      time = 'could not get time data';
    }
  }

  //http://worldtimeapi.org/api/timezone/Europe/Berlin
}
