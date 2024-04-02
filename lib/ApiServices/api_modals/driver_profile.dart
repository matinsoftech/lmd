class DriverProfile {
    bool result;
    DriverData driverData;

    DriverProfile({
        required this.result,
        required this.driverData,
    });

  factory DriverProfile.fromJson(Map<String,dynamic> json){
    return DriverProfile(result: json['result'], driverData: DriverData.fromJson(json['driverData']));
  }
}

class DriverData {
    int id;
    Null driverId;
    int? branchId;
    int status;
    String? slug;
    String? slugDisplay;
    // DateTime? createdAt;
    // DateTime? updatedAt;
    Hasdriver? hasdriver;
    Hasbranch? hasbranch;

    DriverData({
        required this.id,
        required this.driverId,
        required this.branchId,
        required this.status,
        required this.slug,
        required this.slugDisplay,
        // required this.createdAt,
        // required this.updatedAt,
        required this.hasdriver,
        required this.hasbranch,
    });


    factory DriverData.fromJson(Map<String,dynamic> json){
      return DriverData(
       id: json['id'],
      driverId: json['driverId'],
      branchId: json['branchId'],
      status: json['status'],
      slug: json['slug'],
      slugDisplay: json['slugDisplay'],
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      hasdriver: Hasdriver.fromJson(json['hasdriver']),
      hasbranch: Hasbranch.fromJson(json['hasbranch']),        
      );
    }

}

class Hasbranch {
    int? id;
    String? name;
    int? selectedManager;
    String? slug;
    String? slugDisplay;
    dynamic branchAddress;
    dynamic pincode;
    // DateTime createdAt;
    // DateTime updatedAt;

    Hasbranch({
        required this.id,
        required this.name,
        required this.selectedManager,
        required this.slug,
        required this.slugDisplay,
        required this.branchAddress,
        required this.pincode,
        // required this.createdAt,
        // required this.updatedAt,
    });

    factory Hasbranch.fromJson(Map<String, dynamic> json) {
    return Hasbranch(
      id: json['id'],
      name: json['name'],
      selectedManager: json['selectedManager'],
      slug: json['slug'],
      slugDisplay: json['slugDisplay'],
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      branchAddress: json['branchAddress'],
      pincode: json['pincode'],
    );
  }
}



class Hasdriver {
    int? id;
    String? name;
    String? phone;
    dynamic alternatePhone;
    String? address;
    String? email;
    dynamic emailVerifiedAt;
    dynamic imageProfile;
    dynamic profilePath;
    int? collapse;
    int? darkMode;
    int? isActive;
    String? slug;
    String? slugDisplay;
    // DateTime createdAt;
    // DateTime updatedAt;

    Hasdriver({
        required this.id,
        required this.name,
        required this.phone,
        required this.alternatePhone,
        required this.address,
        required this.email,
        required this.emailVerifiedAt,
        required this.imageProfile,
        required this.profilePath,
        required this.collapse,
        required this.darkMode,
        required this.isActive,
        required this.slug,
        required this.slugDisplay,
        // required this.createdAt,
        // required this.updatedAt,
    });
factory Hasdriver.fromJson(Map<String, dynamic> json) {
    return Hasdriver(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      alternatePhone: json['alternatePhone'],
      address: json['address'],
      email: json['email'],
      emailVerifiedAt: json['emailVerifiedAt'],
      imageProfile: json['imageProfile'],
      profilePath: json['profilePath'],
      collapse: json['collapse'],
      darkMode: json['darkMode'],
      isActive: json['isActive'],
      slug: json['slug'],
      slugDisplay: json['slugDisplay'],
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
