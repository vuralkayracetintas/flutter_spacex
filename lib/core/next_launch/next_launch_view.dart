import 'package:flutter/material.dart';
import 'package:spacex_flutter/bloc/next_bloc_f/next_state.dart';
import 'package:spacex_flutter/core/next_launch/next_launch_details.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';

class NextLaunchView extends StatefulWidget {
  const NextLaunchView({
    super.key,
    required this.state,
  });

  @override
  State<NextLaunchView> createState() => _NextLaunchViewState();

  final NextLoadedState state;
}

class _NextLaunchViewState extends State<NextLaunchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.state.nextModel.length,
        itemBuilder: (context, index) {
          final data = widget.state.nextModel[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NextLaunchDetails(
                    data: data,
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.network(
                  data.links.patch.small ??
                      ImageConstans.rocketNotFound, // Varsayılan uzak resim
                ), // Varsayılan asset resmi

                title: Text(data.name ?? 'no name'),
                subtitle: Text(data.details ?? 'no details'),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
ListView.builder(
        itemCount: widget.state.nextModel.id?.length,
        itemBuilder: (context, index) {
          return Text(widget.state.nextModel.name ?? 'no name');
        },
      )
*/
