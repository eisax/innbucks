class CouponInformationOptions{
  String? value,key;
  CouponInformationOptions({this.value, this.key});
 List<CouponInformationOptions> getList(){
    List<CouponInformationOptions> list = [];
    list.add(new CouponInformationOptions(value: "Select",key: ""));
    list.add(new CouponInformationOptions(value: "For Product",key: "product_base"));
    list.add(new CouponInformationOptions(value: "For Total Orders",key: "cart_base"));
    return list;
  }
}

class CouponDiscountOptions{
  String? value,key;
  CouponDiscountOptions({this.value, this.key});
 List<CouponDiscountOptions> getList(){
    List<CouponDiscountOptions> list = [];
    list.add(new CouponDiscountOptions(value: "Amount",key: "amount"));
    list.add(new CouponDiscountOptions(value: "Percentage",key: "percent"));
    return list;
  }
}