import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';
import 'package:fuel_delivery_app_service_provider/constants/firabase_intences.dart';
import 'package:fuel_delivery_app_service_provider/constants/size.dart';
import 'package:fuel_delivery_app_service_provider/constants/size/sizes.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/service_provider_model.dart';
import 'package:fuel_delivery_app_service_provider/core/data/repositories/get_service_provider_data_repository.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/repositories/get_service_provider_data_repo.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/get_serviceprovider_data.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/register_service_provider_bloc/register_serviceprovider_bloc.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/models/menu_model.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/menu_tile_widget.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/menue_pages.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/widgets/side_menu_builder.dart';
import 'package:fuel_delivery_app_service_provider/features/register_service_provider/presentation/cubit/register_service_provider_cubit.dart';
import 'package:gap/gap.dart';

class DesktopHome extends StatefulWidget {
  DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  // fun() async {
  //   ServiceProviderDataModel? s = await GetServiceproviderDataUsecase(
  //           getServiceProviderDataRepository:
  //               GetServiceProviderDataRepositoryImpl())
  //       .exicute(FireSetup.auth.currentUser!.uid);

  //   print(s);
  //   print(s!.isAccepted);
  //   print(s.isRegisterd);
  // }

  @override
  void initState() {
    super.initState();
    // fun();

    final bloc = context.read<RegisterServiceproviderBlocBloc>();
    bloc.add(InitialEvent());
  }

  int selectedIndex = 0;

  bool isSelected = false;
  List<MenueModel> menuItems = [];
  List<Widget> menuePagesList = [];
  @override
  Widget build(BuildContext context) {
    print("this is Home page");

    return BlocConsumer<RegisterServiceproviderBlocBloc,
        RegisterServiceproviderBlocState>(
      listener: (context, state) {
        if (state is NotRegisterdState) {
          menuItems = SideMenueData.notRegisterdmenueItems;
          menuePagesList = MenuePages.notRegisterdPageList;
        }
        if(state is AcceptedAsServiceProviderState ){
           menuItems = SideMenueData.menueItems;
          menuePagesList = MenuePages.menuePagesList;
        }
      },
      builder: (context, state) {
        if (state is DataLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          body: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(41, 84, 81, 81).withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // Shadow on the right side
                      ),
                      BoxShadow(
                        color: Color.fromARGB(30, 33, 33, 33).withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // Shadow on the right side
                      ),
                    ]),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ListView.builder(
                          itemCount: menuItems.length,
                          itemBuilder: (
                            context,
                            index,
                          ) =>
                              GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                              setState(() {});
                            },
                            child: BildMenueEntry(
                              menueItems: menuItems,
                              selectedIndex: selectedIndex,
                              isSelected: selectedIndex == index,
                              index: index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 10,
                child: MenuePageBuilder(
                  menuePages: menuePagesList,
                  index: selectedIndex,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
