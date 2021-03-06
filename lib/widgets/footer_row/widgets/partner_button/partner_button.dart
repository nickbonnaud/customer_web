import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'cubit/partner_button_cubit.dart';

class PartnerButton extends StatefulWidget {

  const PartnerButton({Key? key})
    : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartnerButtonState();
}

class _PartnerButtonState extends State<PartnerButton> with SingleTickerProviderStateMixin {
  late AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _mouseEnter(),
      onExit: (_) => _mouseExit(),
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent)
        ),
        onPressed: () => _goToPartnersButtonPressed(),
        icon: Lottie.asset(
          'lotties/partners.zip',
          controller: _iconController,
          width: _iconDimensions(),
          height: _iconDimensions()
        ),
        label: BlocBuilder<PartnerButtonCubit, bool>(
          builder: (context, isFocused) {
            return Text(
              "Become a Partner",
              style: TextStyle(
                fontSize: _textSize(),
                decoration: isFocused ? TextDecoration.underline : TextDecoration.none
              ),
            );
          }
        )
      ),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  double _iconDimensions() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 110.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 90.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 75.w;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 70.w;
    }
    return 50.w;
  }

  double _textSize() {
    if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) {
      return 35.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan('LARGE_MOBILE')) {
      return 28.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) {
      return 22.sp;
    } else if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return 25.sp;
    }
    return 20.sp;
  }

  void _mouseEnter() {
    _playAnimation();
    BlocProvider.of<PartnerButtonCubit>(context).hoverStatusChanged(isFocused: true);
  }

  void _mouseExit() {
    BlocProvider.of<PartnerButtonCubit>(context).hoverStatusChanged(isFocused: false);
  }

  void _playAnimation() {
    if (_iconController.isAnimating) return;
    _iconController.forward().then((_) =>  _iconController.reset());
  }

  void _goToPartnersButtonPressed() {
    // TODO
    // add go to partner site
  }
}