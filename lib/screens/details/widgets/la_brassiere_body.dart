import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paparless_tech_test/components/custom_text_field.dart';
import 'package:paparless_tech_test/config/utils.dart';
import 'package:paparless_tech_test/constants/color.dart';
import 'package:paparless_tech_test/screens/details/widgets/faq.dart';
import 'package:paparless_tech_test/screens/details/widgets/nav_item_widgets.dart';
import 'package:paparless_tech_test/screens/gallery/gallery.dart';

class LaBrassiereBody extends StatefulWidget {
  const LaBrassiereBody({Key? key}) : super(key: key);

  @override
  State<LaBrassiereBody> createState() => _LaBrassiereBodyState();
}

class _LaBrassiereBodyState extends State<LaBrassiereBody> with SingleTickerProviderStateMixin{
  TextEditingController controller = TextEditingController();

  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 100, end: 350).animate(_controller);
  }

  int _selectedIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }


  final List<Widget> _widgetOptions = [
    NavItemWidgets(title: "About"),
    NavItemWidgets(title: "Our Menu"),
    NavItemWidgets(title: "Features"),
    FAQ(),
    NavItemWidgets(title: "Reviews"),
    Gallery()
  ];



  static const List<Tab> tabs = [
    Tab(
      text: 'About',
    ),
    Tab(
      text: 'Our Menu',
    ),
    Tab(
      text: 'Features',
    ),
    Tab(
      text: 'FAQ',
    ),
    Tab(
      text: 'Reviews',
    ),
    Tab(
      text: 'Gallery',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          width > 600
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: SizedBox(
                    child: Container(
                      height: 50,
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.pink),
                        labelPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 24),
                        indicatorPadding: const EdgeInsets.all(3),
                        labelStyle: GoogleFonts.oxygen(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        labelColor: AppColors.white,
                        unselectedLabelColor: AppColors.black,
                        unselectedLabelStyle: GoogleFonts.oxygen(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        tabs: tabs,
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                )
              : Container(),
          Expanded(
              child: Stack(
                children: [
                  _widgetOptions.elementAt(_selectedIndex),
                  Visibility(
                    visible: width < 700,
                    child: Positioned(
                      bottom: 0,
                      left: 0,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return GestureDetector(
                            onTap: ()=> _handleTap(),
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                curve: Curves.ease,
                                height: _animation.value,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                                  color: AppColors.pink,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(tabs[_selectedIndex].text!,
                                          style: GoogleFonts.oxygen(
                                              fontSize: 26,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.white),
                                        ),
                                        Utils.horizontalPadding(space: 8),
                                         Icon(
                                          _isExpanded ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                                          color: Colors.white,
                                          size: 28,
                                        )
                                      ],
                                    ),
                                    Utils.verticalPadding(space: 20),
                                    SizedBox(height: 12, width:width, child:  Divider(color: _isExpanded ? AppColors.white : Colors.transparent, thickness: 0.5,)),
                                    Expanded(
                                        child: ListView.builder(
                                          itemCount: tabs.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    _selectedIndex = index;
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                  child: Text(
                                                    tabs[index].text!,
                                                    style: GoogleFonts.oxygen(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 18,
                                                      color: AppColors.white
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })

                                    )
                                  ],
                                )
                            ),
                          );
                        }
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  String getChosenTitleName() {
    return "Menu";
  }
}
