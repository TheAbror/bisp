import 'package:chopper/chopper.dart';
import 'package:eduninjav2/core/constants/string_constants.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';

part 'cms_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.base)
abstract class CmsService extends ChopperService {
  static CmsService create([ChopperClient? client]) => _$CmsService(client ?? ChopperClient());

  @Get(path: AppStrings.signIn)
  Future<Response<GeneralResponse>> getCms();
}
