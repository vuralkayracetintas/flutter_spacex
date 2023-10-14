import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';
import 'package:spacex_flutter/product/constans/string_constans.dart';
import 'package:spacex_flutter/product/models/next_model.dart';

class NextLaunchDetails extends StatefulWidget {
  const NextLaunchDetails({
    super.key,
    required this.data,
  });

  final NextLaunchModel data;

  @override
  State<NextLaunchDetails> createState() => _NextLaunchDetailsState();
}

class _NextLaunchDetailsState extends State<NextLaunchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              widget.data.links.patch.small ?? ImageConstans.rocketNotFound,
            ),
            Card(
              child: Padding(
                padding: context.padding.low,
                child: Column(
                  children: [
                    Text(
                      widget.data.name ?? 'no name',
                      maxLines: 1,
                      style: GoogleFonts.raleway(
                          textStyle: context.general.textTheme.headlineLarge),
                    ),
                    Text(widget.data.details ?? 'Details Not Found 😭',
                        style: GoogleFonts.raleway(
                            textStyle:
                                context.general.textTheme.headlineMedium)),
                    Text(
                      'Flight Number 🚀 : ${widget.data.flightNumber.toString()}',
                      style: GoogleFonts.raleway(
                          textStyle: context.general.textTheme.headlineMedium),
                    ),
                    Text(
                        '${StringConstans.date}${extractDate(widget.data.dateUtc.toString())}',
                        style: GoogleFonts.raleway(
                          textStyle:
                              context.general.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Text(
                      widget.data.links.reddit?.launch ??
                          'Reddit Launch Link Not Found ',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String extractDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate =
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    return formattedDate;
  }
}
