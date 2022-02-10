import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_challenge/src/config/app_colors.dart';
import 'package:flutter_ui_challenge/src/presentation/res/common_style.dart';
import 'package:flutter_ui_challenge/src/presentation/shared/widget/app_icon_button.dart';
import 'package:flutter_ui_challenge/src/presentation/shared/widget/common_button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/package_data_cubit.dart';
import 'model/package_data_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Image.asset(
                'assets/image1.png',
                height: 60,
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome ',
                      style: GoogleFonts.alegreyaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF5C5C5C),
                      )),
                  Text(
                    'Emily Cyrus',
                    style: stylepink20,
                  )
                ],
              ),
            ]),
          ),
          const Gap(20),
          const BannerWidget(),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('Your Current Booking', style: styleblue20),
          ),
          const Gap(10),
          BlocBuilder<PackageDataCubit, PackageDataState>(
              builder: (context, state) {
            if (state is PackageLoading) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: kpinkColor,
                  ),
                ),
              );
            }
            if (state is TopPackageLoaded) {
              return BookingWidget(
                currentBookings: state.packagesDataModel!.currentBookings!,
              );
            }

            if (state is PackageDataLoadingError) {
              return Center(child: Text(state.error ?? 'Error'));
            }
            return Container();
          }),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text('Packages', style: styleblue20),
          ),
          const Gap(10),
          BlocBuilder<PackageDataCubit, PackageDataState>(
            builder: (c, state) {
              if (state is PackageLoading) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: kpinkColor,
                    ),
                  ),
                );
              }
              if (state is TopPackageLoaded) {
                return ListView.builder(
                  itemCount: state.packagesDataModel?.packages.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PackagesWidget(
                        color: index.isEven ? kpinkColor : kblueColor,
                        packages: state.packagesDataModel!.packages[index],
                      ),
                    );
                  },
                );
              }
              if (state is PackageDataLoadingError) {
                return Center(child: Text(state.error ?? 'Error'));
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

class BookingWidget extends StatefulWidget {
  CurrentBookings currentBookings;
  BookingWidget({Key? key, required this.currentBookings}) : super(key: key);

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffffff),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14657786),
                offset: Offset(0, 8),
                blurRadius: 16.0,
                spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('One Day Package',
                  style: GoogleFonts.alegreyaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kpink2Color,
                  )),
              CommonButton(
                  text: 'Start',
                  onPressed: () {},
                  color: kpink2Color,
                  kheight: 22)
            ],
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('From',
                          style: GoogleFonts.alegreyaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const Gap(6),
                      Row(
                        children: [
                          Image.asset(
                            'assets/calender2.png',
                            height: 20,
                            width: 20,
                          ),
                          Text(widget.currentBookings.fromDate.toString(),
                              style: styleblue16),
                        ],
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          Image.asset(
                            'assets/clock1.png',
                            height: 20,
                            width: 20,
                          ),
                          Text(widget.currentBookings.fromTime.toString(),
                              style: styleblue16),
                        ],
                      )
                    ],
                  ),
                  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('To',
                          style: GoogleFonts.alegreyaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const Gap(6),
                      Row(
                        children: [
                          Image.asset(
                            'assets/calender2.png',
                            height: 20,
                            width: 20,
                          ),
                          Text(widget.currentBookings.toDate.toString(),
                              style: styleblue16),
                        ],
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          Image.asset(
                            'assets/clock1.png',
                            height: 20,
                            width: 20,
                          ),
                          Text(widget.currentBookings.toTime.toString(),
                              style: styleblue16),
                        ],
                      )
                    ],
                  ),
                  const Gap(6),
                ],
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIconButton(
                icon: const Icon(
                  Icons.star_border_outlined,
                  size: 13,
                ),
                onPressed: () {},
                color: kblue2Color,
                kheight: 20,
                text: 'Rate Us',
              ),
              AppIconButton(
                icon: SizedBox(
                  child: Image.asset(
                    'assets/location.png',
                    height: 14,
                    width: 14,
                  ),
                ),
                onPressed: () {},
                color: kblue2Color,
                kheight: 20,
                text: 'Geolocation',
              ),
              AppIconButton(
                icon: SizedBox(
                  child: Image.asset(
                    'assets/radio.png',
                    height: 14,
                    width: 14,
                  ),
                ),
                onPressed: () {},
                color: kblue2Color,
                kheight: 20,
                text: 'Survillence',
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}

class PackagesWidget extends StatelessWidget {
  final Color? color;
  final Packages packages;
  const PackagesWidget({Key? key, this.color, required this.packages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        color: color ?? kpinkColor,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/calender.png',
                    height: 30,
                    width: 30,
                    color: kpink2Color,
                  ),
                  CommonButton(
                      text: 'Book Now',
                      onPressed: () {},
                      color: kpink2Color,
                      kheight: 25)
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(packages.packageName ?? '',
                      style: GoogleFonts.alegreyaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kblue2Color,
                      )),
                  const Gap(10),
                  Text(packages.price.toString(),
                      style: GoogleFonts.alegreyaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: kblue2Color,
                      )),
                ],
              ),
              const Gap(10),
              Text(packages.description ?? '',
                  maxLines: 2,
                  style: GoogleFonts.alegreyaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF5C5C5C),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 42,
          child: Container(
            decoration: const BoxDecoration(
                color: kpinkColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 160,
            width: MediaQuery.of(context).size.width * 0.9 - 5,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset(
            'assets/homeImage.png',
            alignment: Alignment.centerRight,
            height: 230,
          )
        ]),
        Positioned(
            bottom: 50,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nanny And', style: styleblue20),
                const Gap(3),
                Text('Babysitting Services', style: styleblue20),
                const Gap(12),
                CommonButton(
                  kheight: 25,
                  text: 'Book Now',
                  onPressed: () {},
                  color: kblue2Color,
                ),
              ],
            )),
      ],
    );
  }
}
