import 'package:fake_store/data/network/landing_view_service.dart';
import 'package:fake_store/models/product_model.dart';
import 'package:http/http.dart' as http;

class LandingViewRepository {
final LandingViewService landingViewService=LandingViewService();

  Future<http.Response> getProducts() async{
    return await landingViewService.fetchProducsApi();
  }
}