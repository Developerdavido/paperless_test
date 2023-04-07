import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/view_models/base_provider.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  BaseProvider? baseVm;

  @override
  void initState() {
    super.initState();
    (baseVm = context.read<BaseProvider>()).getImages();
  }

  @override
  Widget build(BuildContext context) {
    baseVm = context.watch<BaseProvider>();
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gallery",
            style: GoogleFonts.oxygen(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.pink),
          ),
          Utils.verticalPadding(space: 4),
          SizedBox(
              height: 12,
              width: width,
              child: const Divider(
                color: Colors.grey,
                thickness: 0.5,
              )),
          Utils.verticalPadding(),
          Expanded(
              child: baseVm!.dogs.isEmpty
                  ? Center(
                      child: Text(
                        "You have no images present at the moment",
                        style: GoogleFonts.oxygen(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.pink),
                      ),
                    )
                  : baseVm!.gettingImages
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.pink,
                          ),
                        )
                      : width > 600
                          ? MasonryGridView.builder(
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: baseVm!.dogs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        baseVm!.dogs[index].url!,
                                        fit: BoxFit.cover,

                                      ),
                                    ),
                                  ),
                                );
                              })
                          : ListView.builder(
                              itemCount: baseVm!.dogs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    width: width * 0.6,
                                    height: width * 0.6,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        baseVm!.dogs[index].url!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }))
        ],
      ),
    );
  }
}
