// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_center_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/upload_service_requst_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/functions/imagepicker_fucntion.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/models/map_mode.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/add_service_feild.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/elevated_button.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
// If you're using image_picker
import 'package:map_location_picker/map_location_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

import 'package:fuel_delivery_app_service_provider/constants/size.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/pdfmodel.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/custom_textfeild_1.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/image_picker.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/location_picker_dailog.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/pdf_picker.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/pdf_view_dailog.dart';
// If you're using file_picker instead

import '../../../../../constants/fonts/fonts.dart';
import '../../../errors/faliure.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class RegisterServices extends StatefulWidget {
  const RegisterServices({super.key});

  @override
  State<RegisterServices> createState() => _RegisterServicesState();
}

class _RegisterServicesState extends State<RegisterServices> {
  List<String> services = [];
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController phoneNuberController = TextEditingController();
  TextEditingController countrConroller = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pdfNameController = TextEditingController();
  TextEditingController servceItemController = TextEditingController();
  TextEditingController mapController = TextEditingController();
  TextEditingController serviceCenterAdminNameController =
      TextEditingController();
  TextEditingController serviceCenterName = TextEditingController();
  TextEditingController addressController = TextEditingController();
  MapModel mapModel=MapModel(logitude: 0, latitude: 0, address: '');
  GeocodingResult? location;
  double latitude = 0;
  double longitude = 0;
  PdfModel? pdfFile;
  final imagePickerController = MultiImagePickerController(
      maxImages: 3,
      picker: (allowMultiple) async {
        return await pickImagesUsingImagePicker(allowMultiple);
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        flex: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(AppSize.gap80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Register ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.lexendBold)),
                        ],
                      ),
                      const Gap(AppSize.gap80),
                      Row(
                        children: [
                          ImagePickerWidget(controller: imagePickerController),
                        ],
                      ),
                      Gap(AppSize.gap30),
                      Row(
                        children: [
                          CustomTextFeeld1(
                            hintText: "Enter Service Center Name",
                            lable: "Service Center Name",
                            textEditingController: serviceCenterName,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.storefront,
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          CustomTextFeeld1(
                            hintText: "Enter Service Center Admin Name",
                            lable: "Service Center Admin Name",
                            textEditingController:
                                serviceCenterAdminNameController,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.person,
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          CustomPhoneFeild(
                            maxLength: 10,
                            hintText: "Enter Phone Number",
                            lable: "Phone Nuber",
                            textEditingController: phoneNuberController,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.contact_page,
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          CustomTextFeeld1(
                            hintText: "Country ",
                            lable: "Contry",
                            textEditingController: countrConroller,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.flag,
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          CustomTextFeeld1(
                            hintText: "State",
                            lable: "State",
                            textEditingController: stateController,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.apartment,
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () async {
                                if (pdfFile == null) {
                                  pdfFile = await PdfPicker.pickFile();
                                  pdfNameController.text = pdfFile!.name;
                                } else {
                                  PdfViewDailog.dialogBox(
                                      context, pdfFile!.image);
                                }
                              },
                              child: LocationFeild(
                                  hintText: "Upload Licence Document",
                                  lable: "",
                                  textEditingController: pdfNameController,
                                  width: AppSize.textFeildWidth2,
                                  prefixIcon: Icons.location_city)),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                    ],
                  ),
                  const Gap(AppSize.gap40),
                  // Gap(AppSize.gap40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Gap(AppSize.gap132),
                      AddServieceFeild(
                        servceItemController: servceItemController,
                        services: services,
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              LocatinPickerDailogBox.locationPickerDailog(
                                  context,
                                  latitude,
                                  longitude,
                                  mapModel,
                                  mapController,
                                  location);
                            },
                            child: LocationFeild(
                                hintText: "Select Location",
                                lable: "",
                                textEditingController: mapController,
                                width: AppSize.textFeildWidth2,
                                prefixIcon: Icons.location_on),
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap30),
                      Row(
                        children: [
                          InkWell(
                            child: CustomTextFeeld1(
                                hintText: "Enter your pine coode",
                                lable: "Pine Code",
                                textEditingController: pinCodeController,
                                width: AppSize.textFeildWidth2,
                                prefixIcon: Icons.markunread),
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap20),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              LocatinPickerDailogBox.locationPickerDailog(
                                context,
                                latitude,
                                longitude,
                                mapModel,
                                mapController,
                                location,
                              );
                            },
                            child: AddressFeild(
                                mapController: mapController,
                                hintText: "Enter your address",
                                label: "Address",
                                textEditingController: addressController,
                                width: AppSize.textFeildWidth2,
                                prefixIcon: Icons.location_on),
                          ),
                        ],
                      ),
                      const Gap(AppSize.gap20),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              child: CustomElevetedButton2(
                                  buttonFunction: () async {
                                    String pdf = "";

                                    List<Uint8List> myimages =
                                        imagePickerController.images
                                            .map(
                                              (e) => e.bytes!,
                                            )
                                            .toList();
                                    UploadServiceCenterRequstImpl
                                        uploadServiceCenterRequstImpl =
                                        UploadServiceCenterRequstImpl();

                                    try {
                                      uploadServiceCenterRequstImpl
                                          .uploadServiceCenterRequest(
                                              image: myimages,
                                              lisenceDocument: pdfFile!.image,
                                              serviceProviderModel:
                                                  ServiceProviderModel(
                                                      serviceCentername:
                                                          serviceCenterName
                                                              .text,
                                                      adminName:
                                                          serviceCenterAdminNameController
                                                              .text,
                                                      address: addressController
                                                          .text,
                                                      country:
                                                          countrConroller.text,
                                                      state:
                                                          stateController.text,
                                                      phoneNuber:
                                                          phoneNuberController
                                                              .text,
                                                      latitude: latitude,
                                                      longitude: longitude));
                                    } on ImageUploadFailure {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.red,
                                              content:
                                                  Text("Image Upload Failed")));
                                    } on PdfUploadFailure {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.yellow,
                                              content:
                                                  Text("PDF Upload Failed")));
                                    } on DataUpdateFailure {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.yellow,
                                              content:
                                                  Text("Data Upload Failed")));
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "Unknown Error :${e.toString()} ")));
                                    }
                                  },
                                  buttonText: "Submiit request"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Gap(AppSize.gap30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<ImageFile>> pickImagesUsingImagePicker(bool allowMultiple) async {
  final picker = ImagePicker();
  final List<XFile> xFiles;
  if (allowMultiple) {
    xFiles = await picker.pickMultiImage(maxWidth: 1080, maxHeight: 1080);
  } else {
    xFiles = [];
    final xFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    if (xFile != null) {
      xFiles.add(xFile);
    }
  }
  if (xFiles.isNotEmpty) {
    List<ImageFile> images = [];
    for (XFile file in xFiles) {
      Uint8List u8 = await file.readAsBytes();
      images.add(convertXFileToImageFile(file, u8: u8));
    }
    return images;

  }
  return [];
}
