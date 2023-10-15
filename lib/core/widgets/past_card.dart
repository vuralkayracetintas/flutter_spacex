import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex_flutter/core/widgets/succes_control_container.dart';
import 'package:spacex_flutter/product/constans/image_constans.dart';
import 'package:spacex_flutter/product/models/past_model.dart';

class PastCart extends StatelessWidget {
  const PastCart({
    super.key,
    required this.data,
  });

  final PastLaunchModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          data.links?.patch?.small ??
              ImageConstans.rocketNotFound, // Varsayılan uzak resim
        ), // Varsayılan asset resmi

        title: Text(data.name ?? 'no name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.details ?? 'no details'),
            data.success == true
                ? const SuccesControlContainer(
                    color: Colors.green,
                    text: 'Success',
                  )
                : const SuccesControlContainer(
                    color: Colors.red,
                    text: 'Fail',
                  ),
          ],
        ),
      ),
    );
  }
}
