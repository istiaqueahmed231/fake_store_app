
import 'package:http/http.dart' as http;

class LandingViewService {
  Future<http.Response> fetchProducsApi() async{
    String url="https://api.escuelajs.co/api/v1/products";
    http.Response response=await http.get(Uri.parse(url));
    return response;

  }
}