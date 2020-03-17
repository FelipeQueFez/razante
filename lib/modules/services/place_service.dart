import 'package:dio/dio.dart';
import 'package:razante/modules/models/location_model.dart';
import 'package:razante/modules/models/places_result_model.dart';
import 'package:razante/modules/models/response_default.dart';

class PlaceService {
  Future<ResponseDefault> getPlaces(LocationModel model) async {
    ResponseDefault result = new ResponseDefault();
    try {
      Response response = await Dio().get(
          "https://us-central1-razante-91422.cloudfunctions.net/getByLocation",
          queryParameters: {
            'lat': model.latitude,
            'long': model.longitude,
            'radius': model.radius,
            'type': model.type
          });

      if (response.statusCode == 200) {
        //TODO:rever
        result.data = placesResultModelFromJson(response.data);
        result.isSucess = true;
      } else {
        result.data = response;
        result.isSucess = false;
      }
    } catch (e) {
      result.data = e;
      result.isSucess = false;
    }

    return result;
  }
}
