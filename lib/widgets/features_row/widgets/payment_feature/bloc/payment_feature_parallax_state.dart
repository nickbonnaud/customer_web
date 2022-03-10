part of 'payment_feature_parallax_bloc.dart';

@immutable
class PaymentFeatureParallaxState extends Equatable {
  final bool isImageVisible;
  final double? currentPosition;
  final double? entryPosition;

  double get parallaxOffset => (entryPosition! - currentPosition!) * .1;
  
  const PaymentFeatureParallaxState({
    required this.isImageVisible,
    this.currentPosition,
    this.entryPosition
  });

  factory PaymentFeatureParallaxState.initial() {
    return const PaymentFeatureParallaxState(isImageVisible: false);
  }

  PaymentFeatureParallaxState update({
    bool? isImageVisible,
    double? currentPosition,
    double? entryPosition,
    bool resetEntry = false
  }) {
    return PaymentFeatureParallaxState(
      isImageVisible: isImageVisible ?? this.isImageVisible,
      currentPosition: currentPosition ?? this.currentPosition,
      entryPosition: resetEntry ? null : entryPosition ?? this.entryPosition
    );
  }

  @override
  List<Object?> get props => [isImageVisible, currentPosition, entryPosition];

  @override
  String toString() => 'PaymentFeatureParallaxState { isImageVisible: $isImageVisible, currentPosition: $currentPosition, entryPosition: $entryPosition }';
}