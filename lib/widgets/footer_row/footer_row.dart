import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/contact_button/contact_button.dart';
import 'widgets/contact_button/cubit/contact_button_cubit.dart';
import 'widgets/dashboard_button/cubit/dashboard_button_cubit.dart';
import 'widgets/dashboard_button/dashboard_button.dart';
import 'widgets/partner_button/cubit/partner_button_cubit.dart';
import 'widgets/partner_button/partner_button.dart';

class FooterRow extends StatelessWidget {
  
  const FooterRow({Key? key})
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          height: 100.h
        ),
        const Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocProvider<ContactButtonCubit>(
                create: (_) => ContactButtonCubit(),
                child: const ContactButton(),
              ),
              BlocProvider<DashboardButtonCubit>(
                create: (_) => DashboardButtonCubit(),
                child: const DashboardButton(),
              ),
              BlocProvider<PartnerButtonCubit>(
                create: (_) => PartnerButtonCubit(),
                child: const PartnerButton(),
              ),
            ],
          ),
        )
      ],
    );
  }
}