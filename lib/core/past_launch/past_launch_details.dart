import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:spacex_flutter/core/widgets/carousel_slider_models.dart';
import 'package:spacex_flutter/core/widgets/custom_link_text_widget.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/models/past_model.dart';

class PastLaunchDetails extends StatefulWidget {
  const PastLaunchDetails({super.key, required this.data});
  final PastLaunchModel data;
  @override
  State<PastLaunchDetails> createState() => _PastLaunchDetailsState();
}

class _PastLaunchDetailsState extends State<PastLaunchDetails> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Launch ID : ${widget.data.id}',
            style: context.general.textTheme.titleMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<void>(
            future: precacheImage(
                NetworkImage(widget.data.links?.patch?.small ??
                    ImageConstans.rocketNotFound),
                context),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text(StringConstans.errorLoadData));
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      widget.data.links?.flickr!.original?.isNotEmpty ?? false
                          ? CarouselSliderModel(
                              items: widget.data.links!.flickr?.original ?? [])
                          : Text(
                              'No Image Found 😭',
                              style: context.general.textTheme.displayMedium,
                            ),
                      Image.network(
                        widget.data.links!.patch?.small ??
                            ImageConstans.rocketNotFound,
                      ),
                      Padding(
                        padding: context.padding.low,
                        child: SizedBox(
                          width: context.sized.width,
                          child: Card(
                            child: Padding(
                              padding: context.padding.medium,
                              child: Column(
                                children: [
                                  Text(
                                    widget.data.name ?? 'no name',
                                    maxLines: 1,
                                    style: GoogleFonts.raleway(
                                        textStyle: context
                                            .general.textTheme.headlineLarge),
                                  ),
                                  Text(
                                      widget.data.details ??
                                          'Details Not Found 😭',
                                      style: GoogleFonts.raleway(
                                          textStyle: context.general.textTheme
                                              .headlineMedium)),
                                  Text(
                                    'Flight Number 🚀 : ${widget.data.flightNumber.toString()}',
                                    style: GoogleFonts.raleway(
                                        textStyle: context
                                            .general.textTheme.headlineMedium),
                                  ),
                                  Text(
                                      '${StringConstans.date}${extractDate(widget.data.dateUtc.toString())}',
                                      style: GoogleFonts.raleway(
                                        textStyle: context
                                            .general.textTheme.titleLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  widget.data.links?.reddit?.launch
                                              ?.isNotEmpty ??
                                          false
                                      ? CustomTextLink(
                                          buttonText:
                                              StringConstans.buttonTextReddit,
                                          url: Uri.parse(
                                            widget.data.links?.reddit?.launch ??
                                                '',
                                          ),
                                          titleText: StringConstans.titleReddit,
                                        )
                                      : Text(
                                          widget.data.links?.reddit?.launch ??
                                              'Reddit Launch Link Not Found :?',
                                          style: context
                                              .general.textTheme.titleMedium,
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
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
