import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuel_delivery_app_service_provider/constants/fonts/fonts.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_center_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/upload_service_requst_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/errors/faliure.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/models/map_mode.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/add_service_feild.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/addnew_service_feild_list.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/pdfmodel.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/registar_serviceprovider_widget.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/custom_textfeild_1.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/elevated_button.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/image_picker.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/location_picker_dailog.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/pdf_picker.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/pdf_view_dailog.dart';
import 'package:gap/gap.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AddNewServiceScreen extends StatelessWidget {
  AddNewServiceScreen({super.key});
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    MapModel mapModel = MapModel(logitude: 0, latitude: 0, address: '');
    GeocodingResult? location;
    double latitude = 0;
    double longitude = 0;
    PdfModel? pdfFile;
    final imagePickerController = MultiImagePickerController(
        maxImages: 3,
        picker: (allowMultiple) async {
          return await pickImagesUsingImagePicker(allowMultiple);
        });
    final feildList =
        AddnewServiceFeildList.getAddNewServiceFeildList(titleController);
    return Expanded(
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
                        Text("Add New Service",
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
                          hintText: "Enter Service Name",
                          lable: "Service Name",
                          textEditingController: serviceCenterName,
                          width: AppSize.textFeildWidth2,
                          prefixIcon: Icons.storefront,
                        ),
                      ],
                    ),
                    const Gap(AppSize.gap30),
                    Row(
                      children: [
                        AddressFeild(
                            mapController: mapController,
                            hintText: "Enter Discription for the Service",
                            label: "Discription",
                            textEditingController: addressController,
                            width: AppSize.textFeildWidth2,
                            prefixIcon: Icons.location_on),
                      ],
                    ),
                    const Gap(AppSize.gap30),
                    DropdownTextField(
                      lableText: "Type of Service",
                      itemList: [
                        "Fuel Delivery",
                        "Car Wash",
                        "Oil Change",
                        "Ev Charging",
                        "Other"
                      ],
                      width: AppSize.textFeildWidth2,
                      prefixIcon: Icons.sell_rounded,
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
                    const Gap(AppSize.gap40),
                    const Gap(35),
                    Row(
                      children: [
                        CustomPhoneFeild(
                          maxLength: 5,
                          hintText: "Distence Avilable",
                          lable: "Enter maximam distence avilable in K/M",
                          textEditingController: phoneNuberController,
                          width: AppSize.textFeildWidth2,
                          prefixIcon: Icons.contact_page,
                        ),
                      ],
                    ),
                    const Gap(AppSize.gap30),
                    Row(
                      children: [
                        CustomPhoneFeild(
                          maxLength: 5,
                          hintText: "Price ",
                          lable: "Enter Price",
                          textEditingController: phoneNuberController,
                          width: AppSize.textFeildWidth2,
                          prefixIcon: Icons.contact_page,
                        ),
                      ],
                    ),
                    const Gap(AppSize.gap30),
                    Row(
                      children: [
                        CustomPhoneFeild(
                          maxLength: 5,
                          hintText: "Discount ",
                          lable: "Enter Discount Price",
                          textEditingController: phoneNuberController,
                          width: AppSize.textFeildWidth2,
                          prefixIcon: Icons.contact_page,
                        ),
                      ],
                    ),
                    const Gap(AppSize.gap30),
                    Row(
                      children: [
                        CustomPhoneFeild(
                          maxLength: 5,
                          hintText: "Final Price ",
                          lable: "Final Price After Discount",
                          textEditingController: phoneNuberController,
                          width: AppSize.textFeildWidth2,
                          prefixIcon: Icons.contact_page,
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
                                            serviceProviderModel: ServiceProviderModel(
                                                serviceCentername:
                                                    serviceCenterName.text,
                                                adminName:
                                                    serviceCenterAdminNameController
                                                        .text,
                                                address: addressController.text,
                                                country: countrConroller.text,
                                                state: stateController.text,
                                                phoneNuber:
                                                    phoneNuberController.text,
                                                latitude: latitude,
                                                longitude: longitude));
                                  } on ImageUploadFailure {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content:
                                                Text("Image Upload Failed")));
                                  } on PdfUploadFailure {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.yellow,
                                            content:
                                                Text("PDF Upload Failed")));
                                  } on DataUpdateFailure {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.yellow,
                                            content:
                                                Text("Data Upload Failed")));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
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
    );
  }
}
