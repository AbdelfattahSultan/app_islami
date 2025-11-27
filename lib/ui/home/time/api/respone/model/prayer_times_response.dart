class PrayerTimesResponse {
  final int code;
  final String status;
  final Data data;

  PrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimesResponse(
      code: json['code'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

// ---------------- DATA ----------------

class Data {
  final Timings timings;
  final Date date;

  Data({
    required this.timings,
    required this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: Timings.fromJson(json["timings"]),
      date: Date.fromJson(json["date"]),
    );
  }
}



class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json["Fajr"],
      sunrise: json["Sunrise"],
      dhuhr: json["Dhuhr"],
      asr: json["Asr"],
      maghrib: json["Maghrib"],
      isha: json["Isha"],
    );
  }
}

// ---------------- DATE ----------------

class Date {
  final String readable;   // "27 Nov 2025"
  final String timestamp;  // لو هتحسب Next Prayer
  final Hijri hijri;
  final Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json["readable"],
      timestamp: json["timestamp"],
      hijri: Hijri.fromJson(json["hijri"]),
      gregorian: Gregorian.fromJson(json["gregorian"]),
    );
  }
}

// ---------------- HIJRI DATE ----------------

class Hijri {
  final String day;
  final String monthEn;
  final String monthAr;
  final String year;

  Hijri({
    required this.day,
    required this.monthEn,
    required this.monthAr,
    required this.year,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      day: json["day"],
      monthEn: json["month"]["en"],
      monthAr: json["month"]["ar"],
      year: json["year"],
    );
  }
}

// ---------------- GREGORIAN ----------------

class Gregorian {
  final String day;
  final String monthEn;
  final String year;
  final String weekday;

  Gregorian({
    required this.day,
    required this.monthEn,
    required this.year,
    required this.weekday,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      day: json["day"],
      monthEn: json["month"]["en"],
      year: json["year"],
      weekday: json["weekday"]["en"],
    );
  }
}
