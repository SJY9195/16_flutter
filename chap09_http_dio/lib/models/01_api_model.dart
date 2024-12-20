import "package:dio/dio.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class ApiModel{
  // Get 요청을 보내서 게시글 목록 가져오기
  Future<List<dynamic>> fetchGets() async{
    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception("get 요청 실패");
    }
  }


  // dio
Future<List<dynamic>> fetchGets2() async {
    final dio = Dio();

    try {
      final response =
      await dio.get("https://jsonplaceholder.typicode.com/posts");

      if (response.statusCode == 200) {
        //json 데이터를 list로 변환
        return response.data as List<dynamic>;
      } else {
        throw Exception("상태코드 200 아님");
      }
    }catch(e){
      throw Exception("에러 발생 : $e");
    }
    }

    /*
    * 무한 스크롤?
    * - 보통 페이지네이션을 사용하여 데이터를 한 번에 모두 불러오는 것이 아니라
    * 페이지 번호를 증가시키면서 필요한 데이터를 서버에서 받아오는 방식으로 처리한다.
    * db 에 정렬되어있는걸 페이지네이션을 적용해 증가시키며 받아 오는 식.
    * */

    Future<List<dynamic>> fetchGets3(int page) async {
      final dio = Dio();
      print(page);
      try {
        final response =
        await dio.get("https://jsonplaceholder.typicode.com/posts");

        if (response.statusCode == 200) {
          //json 데이터를 list로 변환
          return response.data as List<dynamic>;
        } else {
          throw Exception("상태코드 200 아님");
        }
      }catch(e){
        throw Exception("에러 발생 : $e");
      }

    }
  }