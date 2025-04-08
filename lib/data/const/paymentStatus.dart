class PaymentStatus {
  String option_key;
  String name;

  PaymentStatus(this.option_key, this.name);

  static List<PaymentStatus> getPaymentStatusList() {
    return <PaymentStatus>[
      PaymentStatus('', "All"),
      PaymentStatus('paid', "Paid"),
      PaymentStatus('unpaid', "Unpaid"),
    ];
  }

  static List<PaymentStatus> getPaymentStatusListForUpdater() {
    return <PaymentStatus>[
      PaymentStatus('paid', "Paid"),
      PaymentStatus('unpaid', "Unpaid"),
    ];
  }
}
