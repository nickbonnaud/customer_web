part of 'key_holder_cubit.dart';

@immutable
class KeyHolderState extends Equatable {
  final GlobalKey mainScrollKey;
  final GlobalKey pedestalsKey;
  final GlobalKey brainKey;
  final GlobalKey coinsKey;
  final GlobalKey invoiceKey;
  final GlobalKey rocketKey;
  final GlobalKey paymentFeatureImageKey;
  final GlobalKey receiptImageKey;
  final GlobalKey businessImageKey;
  final GlobalKey notificationImageKey;
  final GlobalKey howToKey;

  const KeyHolderState({
    required this.mainScrollKey,
    required this.pedestalsKey,
    required this.brainKey,
    required this.coinsKey,
    required this.invoiceKey,
    required this.rocketKey,
    required this.paymentFeatureImageKey,
    required this.receiptImageKey,
    required this.businessImageKey,
    required this.notificationImageKey,
    required this.howToKey
  });

  factory KeyHolderState.initial() {
    return KeyHolderState(
      mainScrollKey: GlobalKey(),
      pedestalsKey: GlobalKey(),
      brainKey: GlobalKey(),
      coinsKey: GlobalKey(),
      invoiceKey: GlobalKey(),
      rocketKey: GlobalKey(),
      paymentFeatureImageKey: GlobalKey(),
      receiptImageKey: GlobalKey(),
      businessImageKey: GlobalKey(),
      notificationImageKey: GlobalKey(),
      howToKey: GlobalKey()
    );
  }

  @override
  List<Object> get props => [
    mainScrollKey,
    pedestalsKey,
    brainKey,
    coinsKey,
    invoiceKey,
    rocketKey,
    paymentFeatureImageKey,
    receiptImageKey,
    businessImageKey,
    notificationImageKey,
    howToKey
  ];
}
