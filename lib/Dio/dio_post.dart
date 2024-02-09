import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final response = await dio.post('http://localhost:8080/gyms/save',
    data: {
      "gymName" : "PostTest",
      'city' : "Seoul",
      "street" : "Nowon",
      "zipCode" : "0101-0101",
      "gymNumber" : "010104",
      "managerNumber" : "010-12-222"
    },
  );
  print(response.data);
}
