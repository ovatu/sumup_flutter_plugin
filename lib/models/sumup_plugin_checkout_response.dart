import 'dart:io';

// TODO add products field

/// Checkout response object.
///
/// Contains all the transaction informations.
/// Some fields are available for Android only.
class SumupPluginCheckoutResponse {
  SumupPluginCheckoutResponse({
    this.success,
    this.transactionCode,
    this.cardLastDigits,
    this.cardType,
    this.receiptSent,
    this.foreignTransactionId,
    this.amount,
    this.vatAmount,
    this.tipAmount,
    this.currency,
    this.paymentType,
    this.entryMode,
    this.installments,
  });

  SumupPluginCheckoutResponse.fromMap(Map<dynamic, dynamic> response) {
    success = response['success'];
    transactionCode = response['transactionCode']?.toString();
    amount = double.tryParse(response['amount']?.toString() ?? '');
    currency = response['currency']?.toString();
    vatAmount = double.tryParse(response['vatAmount']?.toString() ?? '');
    tipAmount = double.tryParse(response['tipAmount']?.toString() ?? '');
    paymentType = response['paymentType']?.toString();
    entryMode = response['entryMode']?.toString();
    installments = int.tryParse(response['installments']?.toString() ?? '');
    cardType = response['cardType']?.toString();
    cardLastDigits = response['cardLastDigits']?.toString();

    // some parameters are available only for Android
    if (Platform.isAndroid) {
      foreignTransactionId = response['foreignTransactionId']?.toString();
      receiptSent = response['receiptSent'];
    }
  }

  /// Transaction's outcome
  bool? success;

  String? transactionCode;
  String? cardLastDigits;
  String? cardType;

  /// Total amount including tip and VAT
  double? amount;

  double? vatAmount;
  double? tipAmount;
  String? currency;
  String? paymentType;
  String? entryMode;
  int? installments;

  /// **Android only**
  bool? receiptSent;

  /// **Android only**
  String? foreignTransactionId;

  String toString() {
    return 'Success: $success, transactionCode: $transactionCode, amount: $amount, currency: $currency';
  }
}
