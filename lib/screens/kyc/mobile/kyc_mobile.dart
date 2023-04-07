import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/constants/drawer.dart';
import 'package:paparless_tech_test/screens/kyc/widgets/kyc_image_containers.dart';
import 'package:paparless_tech_test/screens/kyc/widgets/pop_up_menu_widget.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';


class KYCMobile extends StatelessWidget {
  const KYCMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BaseProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: drawer,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Paperless Listings",
            style: GoogleFonts.oxygen(
                color: AppColors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
        leadingWidth: 24,
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openEndDrawer();
            }, icon: const  Icon(Icons.menu, color: AppColors.black, size: 28,),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Verify your Identity",
                style: GoogleFonts.oxygen(
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
              Utils.verticalPadding(),
              Text("For you to post a listing, we require you to upload an identification document ",
                style: GoogleFonts.oxygen(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.center,
              ),
              Utils.verticalPadding(),
              SelectDocumentType(baseProvider: vm,),
              Utils.verticalPadding(),
              KYCImageContainer(
                xFile: vm.frontImage,
                imageId: "assets/images/id_front.png",
                text: "Upload an image of the front",
                clear: (){},
                getImage: (){
                  vm.selectFrontImage(context);
                },
              ),
              Utils.verticalPadding(),
              KYCImageContainer(
                xFile: vm.backImage,
                imageId: "assets/images/id_back.png",
                text: "Upload an image of the back",
                clear: (){},
                getImage: (){
                  vm.selectBackImage(context);
                },
              ),
              Utils.verticalPadding(space: 32),
              CustomButton(
                titleSize: 16,
                color: AppColors.pink,
                titleColor: AppColors.white,
                isLoading: vm.uploadingImage,
                onPressed: () async {
                  await vm.uploadImage(context);
                },
                title: "Next",
                radius: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
