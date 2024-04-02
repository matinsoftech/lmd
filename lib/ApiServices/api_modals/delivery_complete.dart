class DeliveryComplete {
  List<DeliveryCompleteData>? deliveryCompleteData;
  String? status;

  DeliveryComplete({this.deliveryCompleteData, this.status});

  DeliveryComplete.fromJson(Map<String, dynamic> json) {
    if (json['data_lists'] != null) {
      deliveryCompleteData = <DeliveryCompleteData>[];
      json['data_lists'].forEach((v) {
        deliveryCompleteData!.add(new DeliveryCompleteData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveryCompleteData != null) {
      data['data_lists'] =
          this.deliveryCompleteData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class DeliveryCompleteData {
  int? id;
  String? orderId;
  String? date;
  int? orderType;
  int? originBranch;
  int? destinationBranch;
  String? selectWarehouse;
  int? vendorId;
  int? adminId;
  int? managerId;
  int? customerId;
  int? status;
  int? orderStatus;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;
  HasoriginBranch? hasoriginBranch;
  HasdestinationBranch? hasdestinationBranch;
  Hasordertype? hasordertype;
  Hasparceltype? hasparceltype;
  Hascourier? hascourier;
  Hassender? hassender;
  Hasreceiver? hasreceiver;
  Hasdriverfordelivery? hasdriverfordelivery;

  DeliveryCompleteData(
      {this.id,
      this.orderId,
      this.date,
      this.orderType,
      this.originBranch,
      this.destinationBranch,
      this.selectWarehouse,
      this.vendorId,
      this.adminId,
      this.managerId,
      this.customerId,
      this.status,
      this.orderStatus,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt,
      this.hasoriginBranch,
      this.hasdestinationBranch,
      this.hasordertype,
      this.hasparceltype,
      this.hascourier,
      this.hassender,
      this.hasreceiver,
      this.hasdriverfordelivery});

  DeliveryCompleteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    date = json['date'];
    orderType = json['order_type'];
    originBranch = json['origin_branch'];
    destinationBranch = json['destination_branch'];
    selectWarehouse = json['select_warehouse'];
    vendorId = json['vendor_id'];
    adminId = json['admin_id'];
    managerId = json['manager_id'];
    customerId = json['customer_id'];
    status = json['status'];
    orderStatus = json['order_status'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasoriginBranch = json['hasorigin_branch'] != null
        ? new HasoriginBranch.fromJson(json['hasorigin_branch'])
        : null;
    hasdestinationBranch = json['hasdestination_branch'] != null
        ? new HasdestinationBranch.fromJson(json['hasdestination_branch'])
        : null;
    hasordertype = json['hasordertype'] != null
        ? new Hasordertype.fromJson(json['hasordertype'])
        : null;
    hasparceltype = json['hasparceltype'] != null
        ? new Hasparceltype.fromJson(json['hasparceltype'])
        : null;
    hascourier = json['hascourier'] != null
        ? new Hascourier.fromJson(json['hascourier'])
        : null;
    hassender = json['hassender'] != null
        ? new Hassender.fromJson(json['hassender'])
        : null;
    hasreceiver = json['hasreceiver'] != null
        ? new Hasreceiver.fromJson(json['hasreceiver'])
        : null;
    hasdriverfordelivery = json['hasdriverfordelivery'] != null
        ? new Hasdriverfordelivery.fromJson(json['hasdriverfordelivery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['date'] = this.date;
    data['order_type'] = this.orderType;
    data['origin_branch'] = this.originBranch;
    data['destination_branch'] = this.destinationBranch;
    data['select_warehouse'] = this.selectWarehouse;
    data['vendor_id'] = this.vendorId;
    data['admin_id'] = this.adminId;
    data['manager_id'] = this.managerId;
    data['customer_id'] = this.customerId;
    data['status'] = this.status;
    data['order_status'] = this.orderStatus;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.hasoriginBranch != null) {
      data['hasorigin_branch'] = this.hasoriginBranch!.toJson();
    }
    if (this.hasdestinationBranch != null) {
      data['hasdestination_branch'] = this.hasdestinationBranch!.toJson();
    }
    if (this.hasordertype != null) {
      data['hasordertype'] = this.hasordertype!.toJson();
    }
    if (this.hasparceltype != null) {
      data['hasparceltype'] = this.hasparceltype!.toJson();
    }
    if (this.hascourier != null) {
      data['hascourier'] = this.hascourier!.toJson();
    }
    if (this.hassender != null) {
      data['hassender'] = this.hassender!.toJson();
    }
    if (this.hasreceiver != null) {
      data['hasreceiver'] = this.hasreceiver!.toJson();
    }
    if (this.hasdriverfordelivery != null) {
      data['hasdriverfordelivery'] = this.hasdriverfordelivery!.toJson();
    }
    return data;
  }
}

class HasoriginBranch {
  int? id;
  String? name;
  int? selectedManager;
  String? branchAddress;
  String? pincode;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;

  HasoriginBranch(
      {this.id,
      this.name,
      this.selectedManager,
      this.branchAddress,
      this.pincode,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt});

  HasoriginBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selectedManager = json['selected_manager'];
    branchAddress = json['branch_address'];
    pincode = json['pincode'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selected_manager'] = this.selectedManager;
    data['branch_address'] = this.branchAddress;
    data['pincode'] = this.pincode;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class HasdestinationBranch {
  int? id;
  String? name;
  int? selectedManager;
  String? branchAddress;
  String? pincode;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;

  HasdestinationBranch(
      {this.id,
      this.name,
      this.selectedManager,
      this.branchAddress,
      this.pincode,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt});

  HasdestinationBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selectedManager = json['selected_manager'];
    branchAddress = json['branch_address'];
    pincode = json['pincode'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selected_manager'] = this.selectedManager;
    data['branch_address'] = this.branchAddress;
    data['pincode'] = this.pincode;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Hasordertype {
  int? id;
  String? name;
  String? description;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;

  Hasordertype(
      {this.id,
      this.name,
      this.description,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt});

  Hasordertype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Hasparceltype {
  int? id;
  String? name;
  String? ratePerUnitVolume;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;
  int? laravelThroughKey;

  Hasparceltype(
      {this.id,
      this.name,
      this.ratePerUnitVolume,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt,
      this.laravelThroughKey});

  Hasparceltype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratePerUnitVolume = json['rate_per_unit_volume'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    laravelThroughKey = json['laravel_through_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rate_per_unit_volume'] = this.ratePerUnitVolume;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['laravel_through_key'] = this.laravelThroughKey;
    return data;
  }
}

class Hascourier {
  int? id;
  int? orderId;
  int? parcelType;
  String? parcelRate;
  String? name;
  String? quantity;
  int? insurance;
  String? insuranceAmount;
  String? priceOption;
  String? weight;
  String? length;
  String? breadth;
  String? height;
  String? actWeight;
  String? chargedWt;
  String? weightQuantity;
  String? manualQuantity;
  String? manualPrice;
  String? weightVolumeCharge;
  String? docketCharge;
  String? fuelCharge;
  String? beforeGst;
  String? sgst;
  String? cgst;
  String? igst;
  String? igstAmount;
  String? grandTotal;
  String? totalVolume;
  int? cod;
  String? locationDeliveryCharge;
  String? totalParcelPrice;
  String? codAmount;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;

  Hascourier(
      {this.id,
      this.orderId,
      this.parcelType,
      this.parcelRate,
      this.name,
      this.quantity,
      this.insurance,
      this.insuranceAmount,
      this.priceOption,
      this.weight,
      this.length,
      this.breadth,
      this.height,
      this.actWeight,
      this.chargedWt,
      this.weightQuantity,
      this.manualQuantity,
      this.manualPrice,
      this.weightVolumeCharge,
      this.docketCharge,
      this.fuelCharge,
      this.beforeGst,
      this.sgst,
      this.cgst,
      this.igst,
      this.igstAmount,
      this.grandTotal,
      this.totalVolume,
      this.cod,
      this.locationDeliveryCharge,
      this.totalParcelPrice,
      this.codAmount,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt});

  Hascourier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    parcelType = json['parcel_type'];
    parcelRate = json['parcel_rate'];
    name = json['name'];
    quantity = json['quantity'];
    insurance = json['insurance'];
    insuranceAmount = json['insurance_amount'];
    priceOption = json['price_option'];
    weight = json['weight'];
    length = json['length'];
    breadth = json['breadth'];
    height = json['height'];
    actWeight = json['act_weight'];
    chargedWt = json['charged_wt'];
    weightQuantity = json['weight_quantity'];
    manualQuantity = json['manual_quantity'];
    manualPrice = json['manual_price'];
    weightVolumeCharge = json['weight_volume_charge'];
    docketCharge = json['docket_charge'];
    fuelCharge = json['fuel_charge'];
    beforeGst = json['before_gst'];
    sgst = json['sgst'];
    cgst = json['cgst'];
    igst = json['igst'];
    igstAmount = json['igst_amount'];
    grandTotal = json['grand_total'];
    totalVolume = json['total_volume'];
    cod = json['cod'];
    locationDeliveryCharge = json['location_delivery_charge'];
    totalParcelPrice = json['total_parcel_price'];
    codAmount = json['cod_amount'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['parcel_type'] = this.parcelType;
    data['parcel_rate'] = this.parcelRate;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['insurance'] = this.insurance;
    data['insurance_amount'] = this.insuranceAmount;
    data['price_option'] = this.priceOption;
    data['weight'] = this.weight;
    data['length'] = this.length;
    data['breadth'] = this.breadth;
    data['height'] = this.height;
    data['act_weight'] = this.actWeight;
    data['charged_wt'] = this.chargedWt;
    data['weight_quantity'] = this.weightQuantity;
    data['manual_quantity'] = this.manualQuantity;
    data['manual_price'] = this.manualPrice;
    data['weight_volume_charge'] = this.weightVolumeCharge;
    data['docket_charge'] = this.docketCharge;
    data['fuel_charge'] = this.fuelCharge;
    data['before_gst'] = this.beforeGst;
    data['sgst'] = this.sgst;
    data['cgst'] = this.cgst;
    data['igst'] = this.igst;
    data['igst_amount'] = this.igstAmount;
    data['grand_total'] = this.grandTotal;
    data['total_volume'] = this.totalVolume;
    data['cod'] = this.cod;
    data['location_delivery_charge'] = this.locationDeliveryCharge;
    data['total_parcel_price'] = this.totalParcelPrice;
    data['cod_amount'] = this.codAmount;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Hassender {
  int? id;
  int? orderId;
  String? name;
  String? email;
  String? phone;
  String? alternatePhone;
  String? address;
  String? mapAddress;
  String? addressLatitude;
  String? addressLongitude;
  String? slug;
  String? slugDisplay;
  String? gstin;
  String? createdAt;
  String? updatedAt;

  Hassender(
      {this.id,
      this.orderId,
      this.name,
      this.email,
      this.phone,
      this.alternatePhone,
      this.address,
      this.mapAddress,
      this.addressLatitude,
      this.addressLongitude,
      this.slug,
      this.slugDisplay,
      this.gstin,
      this.createdAt,
      this.updatedAt});

  Hassender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    address = json['address'];
    mapAddress = json['map_address'];
    addressLatitude = json['address_latitude'];
    addressLongitude = json['address_longitude'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    gstin = json['gstin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['alternate_phone'] = this.alternatePhone;
    data['address'] = this.address;
    data['map_address'] = this.mapAddress;
    data['address_latitude'] = this.addressLatitude;
    data['address_longitude'] = this.addressLongitude;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['gstin'] = this.gstin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Hasreceiver {
  int? id;
  int? orderId;
  String? name;
  String? email;
  String? phone;
  String? alternatePhone;
  String? address;
  String? mapAddress;
  String? addressLatitude;
  String? addressLongitude;
  String? slug;
  String? slugDisplay;
  String? pincode;
  String? gstin;
  String? createdAt;
  String? updatedAt;

  Hasreceiver(
      {this.id,
      this.orderId,
      this.name,
      this.email,
      this.phone,
      this.alternatePhone,
      this.address,
      this.mapAddress,
      this.addressLatitude,
      this.addressLongitude,
      this.slug,
      this.slugDisplay,
      this.pincode,
      this.gstin,
      this.createdAt,
      this.updatedAt});

  Hasreceiver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    address = json['address'];
    mapAddress = json['map_address'];
    addressLatitude = json['address_latitude'];
    addressLongitude = json['address_longitude'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    pincode = json['pincode'];
    gstin = json['gstin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['alternate_phone'] = this.alternatePhone;
    data['address'] = this.address;
    data['map_address'] = this.mapAddress;
    data['address_latitude'] = this.addressLatitude;
    data['address_longitude'] = this.addressLongitude;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['pincode'] = this.pincode;
    data['gstin'] = this.gstin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Hasdriverfordelivery {
  int? id;
  int? orderId;
  int? driverId;
  int? orderDelevered;
  String? slug;
  String? slugDisplay;
  String? createdAt;
  String? updatedAt;

  Hasdriverfordelivery(
      {this.id,
      this.orderId,
      this.driverId,
      this.orderDelevered,
      this.slug,
      this.slugDisplay,
      this.createdAt,
      this.updatedAt});

  Hasdriverfordelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    driverId = json['driver_id'];
    orderDelevered = json['order_delevered'];
    slug = json['slug'];
    slugDisplay = json['slug_display'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['driver_id'] = this.driverId;
    data['order_delevered'] = this.orderDelevered;
    data['slug'] = this.slug;
    data['slug_display'] = this.slugDisplay;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
