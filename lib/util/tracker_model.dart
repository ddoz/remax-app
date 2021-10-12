class TrackerModel {
  final int id;
  final String date;
  final String title;
  final String propertyType;
  final String ownerName;
  final String gender;
  final String ownerPhone;
  final String ownerMail;
  final String transactionType;
  final String buyerName;
  final String buyerPhone;
  final String buyerMail;
  final String startDate;
  final String endDate;
  final String propertyStatus;
  final String price;
  final String priceType;
  final String foto;
  final String notaryName;
  final String notaryPhone;
  final String statusData;
  final String modifiedData;

  TrackerModel(
      {this.id,
      this.date,
      this.title,
      this.propertyType,
      this.ownerName,
      this.gender,
      this.ownerPhone,
      this.ownerMail,
      this.transactionType,
      this.buyerName,
      this.buyerPhone,
      this.buyerMail,
      this.startDate,
      this.endDate,
      this.propertyStatus,
      this.price,
      this.priceType,
      this.foto,
      this.notaryName,
      this.notaryPhone,
      this.statusData,
      this.modifiedData});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "date": date,
      "title": title,
      "propertyType": propertyType,
      "ownerName": ownerName,
      "gender": gender,
      "ownerPhone": ownerPhone,
      "ownerMail": ownerMail,
      "transactionType": transactionType,
      "buyerName": buyerName,
      "buyerPhone": buyerPhone,
      "buyerMail": buyerMail,
      "startDate": startDate,
      "endDate": endDate,
      "propertyStatus": propertyStatus,
      "price": price,
      "priceType": priceType,
      "foto": foto,
      "notaryName": notaryName,
      "notaryPhone": notaryPhone,
      "statusData": statusData,
      "modifiedData": modifiedData
    };
  }
}
