import 'package:chopper/chopper.dart';

class CustomDataConverter extends JsonConverter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);

    var body = dynamicResponse.body;

    final BodyType customBody = convertToCustomObject<BodyType, InnerType>(body);

    return dynamicResponse.copyWith<BodyType>(
      body: customBody,
    );
  }

  BodyType convertToCustomObject<BodyType, SingleItemType>(dynamic element) {
    if (element is List) {
      return deserializeListOf<BodyType, SingleItemType>(element);
    } else {
      return deserialize<SingleItemType>(element);
    }
  }

  dynamic deserializeListOf<BodyType, SingleItemType>(
    List dynamicList,
  ) {
    List<SingleItemType> list =
        dynamicList.map<SingleItemType>((element) => deserialize<SingleItemType>(element)).toList();
    return list;
  }

  dynamic deserialize<SingleItemType>(Map<String, dynamic> json) {
    switch (SingleItemType) {
      case int:
        return int;

      // case DashboardModuleResponse:
      //   return DashboardModuleResponse.fromJson(json);

      default:
        return null;
    }
  }
}
