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
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocProvider<ContactButtonCubit>(
            create: (_) => ContactButtonCubit(),
            child: ContactButton(),
          ),
          BlocProvider<DashboardButtonCubit>(
            create: (_) => DashboardButtonCubit(),
            child: DashboardButton(),
          ),
          BlocProvider<PartnerButtonCubit>(
            create: (_) => PartnerButtonCubit(),
            child: PartnerButton(),
          ),
        ],
      ),
    );
  }
}