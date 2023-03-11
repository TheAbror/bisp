import 'package:chopper/chopper.dart';
import 'package:eduninjav2/core/constants/string_constants.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';

part 'cms_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.base)
abstract class TimetableService extends ChopperService {
  static TimetableService create([ChopperClient? client]) => _$TimetableService(client ?? ChopperClient());

  @Get(path: AppStrings.signIn)
  Future<Response<TimetableResponse>> getTimetableInfo({@Path('groupID') int? groupID});
}
