import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_center_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/upload_service_requst_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/service_provider_requst.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';

class UploadServiceProviderDataUsecase {
  UploadServiceCenterRequst _uploadServiceCenterReqst =
      UploadServiceCenterRequstImpl();
  UploadServiceProviderDataUsecase();
  Future<Either<Failure, String>> exicute(
      {required List<Uint8List> image,
      required Uint8List lisenceDocument,
      required ServiceProviderModel serviceProviderModel}) async {
    try {
      bool isUploadSucessFull =
          await _uploadServiceCenterReqst.uploadServiceCenterRequest(
              image: image,
              lisenceDocument: lisenceDocument,
              serviceProviderModel: serviceProviderModel);
      return Right("Sucess");
    } catch (e) {
      print("the proble is $e");
      return Left(UnknownFailure(e.toString()));
    }
  }
}
