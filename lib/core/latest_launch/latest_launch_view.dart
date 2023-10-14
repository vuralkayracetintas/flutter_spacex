import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:spacex_flutter/bloc/latest_bloc_f/lates_states.dart';
import 'package:spacex_flutter/core/widgets/carousel_slider_latest_launch.dart';
import 'package:spacex_flutter/core/widgets/custom_link_text_widget.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';

class LatestLaunch extends StatefulWidget {
  const LatestLaunch({
    Key? key,
    required this.size,
    required this.state,
    required this.index,
  }) : super(key: key);

  final Size size;
  final SpacexLoadedState state;
  final int index;

  @override
  State<LatestLaunch> createState() => _LatestLaunchState();
}

class _LatestLaunchState extends State<LatestLaunch> {
  @override
  Widget build(BuildContext context) {
    var crewMember = widget.state.spacexModel.crew[widget.index];
    final Uri urlReddit =
        Uri.parse(widget.state.spacexModel.links.reddit.launch);
    final Uri urlYoutube = Uri.parse(widget.state.spacexModel.links.webcast);
    final Uri urlWikipedia =
        Uri.parse(widget.state.spacexModel.links.wikipedia);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: context.padding.low,
        child: FutureBuilder<void>(
          future: precacheImage(
              NetworkImage(widget.state.spacexModel.links.patch.small),
              context),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text(StringConstans.errorLoadData));
            } else {
              return Center(
                child: Column(
                  children: [
                    const CarouselSliderLatestLaunch(),
                    ListTile(
                      leading: Image.network(
                        widget.state.spacexModel.links.patch.small,
                      ),
                      title: Text(
                        widget.state.spacexModel.name,
                        style: GoogleFonts.raleway(
                          textStyle:
                              context.general.textTheme.displayMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${StringConstans.date}${extractDate(widget.state.spacexModel.dateUtc.toString())}',
                              style: GoogleFonts.raleway(
                                textStyle: context.general.textTheme.titleLarge!
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Text(
                              '${StringConstans.flightNumber} ${widget.state.spacexModel.flightNumber.toString()}',
                              style: GoogleFonts.raleway(
                                textStyle: context.general.textTheme.titleLarge!
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: context.padding.low,
                      child: Text(
                        widget.state.spacexModel.details == null
                            ? StringConstans.detaildValueNot
                            : widget.state.spacexModel.details!,
                        style: GoogleFonts.raleway(
                          textStyle:
                              context.general.textTheme.titleMedium!.copyWith(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView(
                        children: List<Widget>.generate(
                          widget.state.spacexModel.crew.length,
                          (index) {
                            return Card(
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                        ImageConstans.imageNotFound)),
                                title: Text(
                                    widget.state.spacexModel.crew[index].role ??
                                        'Not role '),
                                subtitle: Text(
                                    widget.state.spacexModel.crew[index].crew ??
                                        'Not crew'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextReddit,
                      url: urlReddit,
                      titleText: StringConstans.titleReddit,
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextYoutube,
                      url: urlYoutube,
                      titleText: StringConstans.titleYoutube,
                    ),
                    CustomTextLink(
                      buttonText: StringConstans.buttonTextWiki,
                      url: urlWikipedia,
                      titleText: StringConstans.titleWiki,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    ));
  }

  String extractDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate =
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    return formattedDate;
  }
}
