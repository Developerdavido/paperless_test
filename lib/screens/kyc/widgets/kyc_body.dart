import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_button.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/screens/kyc/widgets/kyc_image_containers.dart';
import 'package:paparless_tech_test/screens/kyc/widgets/pop_up_menu_widget.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';

class KYCBody extends StatelessWidget {
  const KYCBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BaseProvider>(context, listen: true);
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: SizedBox(
          width: width > 850 ? 620 : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KYCImageContainer(
                    xFile: vm.frontImage,
                    imageId: "assets/images/id_front.png",
                    text: "Upload an image of the front",
                    clear: (){},
                    getImage: (){
                      vm.selectFrontImage(context);
                    },
                  ),
                  Utils.horizontalPadding(),
                  KYCImageContainer(
                    xFile: vm.backImage,
                    imageId: "assets/images/id_back.png",
                    text: "Upload an image of the back",
                    clear: (){},
                    getImage: (){
                      vm.selectBackImage(context);
                    },
                  ),
                ],
              ),
              Utils.verticalPadding(space: 32),
              CustomButton(
                titleSize: 16,
                color: AppColors.pink,
                titleColor: AppColors.white,
                isLoading: vm.uploadingImage,
                onPressed: () async {
                  await vm.uploadImage(context, isWeb: true);
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
