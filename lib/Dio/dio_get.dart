
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  try {
    // Dio를 사용하여 데이터를 가져옴
    final response = await dio.get('http://localhost:8080/gyms/all');

    // 응답에서 데이터 부분을 추출 (Map 형식)
    final responseData = response.data;

    // 'data' 키에 해당하는 값을 추출 (List<dynamic> 형식)
    final List<dynamic> gymsData = responseData['data'];

    // 각 체육관에 대한 정보 출력g
    for (final gymData in gymsData) {
      // 각 체육관 정보를 Map<String, dynamic>으로 변환
      final Map<String, dynamic> gym = gymData as Map<String, dynamic>;

      final gymName = gym['gymName'];
      final gymSports = gym['gymSports'];

      // 가져온 값 출력
      print('Gym Name: $gymName');
      print('Gym Sports: $gymSports');
      print('---');
    }
  } catch (e) {
    // 오류 처리
    print('Error: $e');
  }
}
