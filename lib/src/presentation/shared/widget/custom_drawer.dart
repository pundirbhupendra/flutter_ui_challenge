import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/src/config/app_colors.dart';
import 'package:flutter_ui_challenge/src/features/home/main_home_page.dart';
import 'package:flutter_ui_challenge/src/presentation/res/common_style.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonDrawerPage extends StatefulWidget {
  static const routeName = '/';
  final Widget widgets;
  final int? selectedId;
  const CommonDrawerPage({
    Key? key,
    required this.widgets,
    this.selectedId,
  }) : super(key: key);

  @override
  _CommonDrawerPageState createState() => _CommonDrawerPageState();
}

class _CommonDrawerPageState extends State<CommonDrawerPage> {
  int? selectedMenuItemId;
  @override
  void initState() {
    setState(() {
      selectedMenuItemId = widget.selectedId ?? 0;
    });
    super.initState();
  }

  DrawerScaffoldController controller = DrawerScaffoldController();
  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      controller: controller,
      backgroundColor: Colors.white,
      cornerRadius: 0,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                'assets/icon.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              onPressed: () => controller.openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      drawers: [
        SideDrawer(
          selectorColor: Colors.white,
          percentage: 0.8,
          drawerWidth: MediaQuery.of(context).size.width * 0.8,
          
          headerView: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image1.png',
                    height: 60,
                  ),
                  const Gap(8),
                  Text(
                    'Emily Cyrus',
                    style: stylepink20,
                  )
                ]),
          ),
          itemBuilder: (c, m, i) {
            return Column(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(
                  padding: const EdgeInsets.only(left: 25,),
                  child: SizedBox(
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(m.title, style: style),
                     const  Padding(
                         padding:  EdgeInsets.only(right: 80),
                         child: Divider(
                           indent: 10,
                           thickness: 1,
                           
                            color: kpinkColor
                          ),
                       ),

                          
                        ],
                      ))),
            ]);
          },
          menu: menu,
          animation: true,
          color: Colors.white,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            if (itemId == 0) {
              setState(() {
                selectedMenuItemId = 0;
              });
              // Navigator.pushNamedAndRemoveUntil(
              //     context, MainHomePage.mainHomePage, (route) => false);
            }
          },
        )
      ],
      builder: (context, id) => IndexedStack(index: id, children: [
        Visibility(visible: id == 0, child: const MainHomePage()),
        Visibility(visible: id == 1, child: const SizedBox()),
        Visibility(
          visible: id == 2,
          child: const SizedBox(),
        ),
      ]),
    );
  }
}

final style = GoogleFonts.alegreyaSans(
  fontSize: 20,
  fontWeight: FontWeight.w700,
color:const Color(0xFF5C5C5C),
);

List<MenuItem<int>> items = [
  MenuItem<int>(id: 0, title: 'Home', textStyle: style),
  MenuItem<int>(id: 1, title: 'Book A Nanny', textStyle: style),
  MenuItem<int>(id: 2, title: 'How It Works', textStyle: style),
  MenuItem<int>(id: 3, title: 'Why Nanny Vanny', textStyle: style),
  MenuItem<int>(id: 4, title: 'My Bookings', textStyle: style),
  MenuItem<int>(id: 5, title: 'My Profile', textStyle: style),
  MenuItem<int>(id: 6, title: 'Support', textStyle: style),
];
final menu = Menu(
  items: items.map((e) => e.copyWith(prefix: null)).toList(),
);
