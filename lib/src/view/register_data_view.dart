import 'package:changa/src/models/register_model.dart';
import 'package:changa/src/widgets/register_data_step0.dart';
import 'package:changa/src/widgets/register_data_step1.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RegisterDataView extends StatelessWidget {
  static const routeName = '/RegisterDataView';

  const RegisterDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<RegisterModel>(
      context,
      listen: true,
    ).currentPage;
    debugPrint(
      'RegisterDataView didChangeDependencies currentPageBar: $currentPage',
    );

    final pages = [
      const RegisterDataStep0(),
      const RegisterDataStep1(),
    ];

    return Scaffold(
      body: Container(
        child: pages[currentPage],
      ),
    );
  }
}
