
import 'dart:io';
import 'package:cafeapp/Pages/Admin/AdminUpdateOfferPage/AdminUpdateOfferView.dart';

class OfferModel {

  void updateString(String cafeId, String offerTitle, String offerDetail,String offerTag, String description, File picturePath) {
    AdminUpdateOfferState(cafeId).setButton = "Güncelle";
    AdminUpdateOfferState(cafeId).offerTitleHintText = offerTitle;
    AdminUpdateOfferState(cafeId).offerDetailHintText = offerDetail;
    AdminUpdateOfferState(cafeId).offerTagHintText = offerTag;
    AdminUpdateOfferState(cafeId).descriptionHintText = description;
    AdminUpdateOfferState(cafeId).picturePathHintText = picturePath.toString();
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }

  void createString(String cafeId) {
    AdminUpdateOfferState(cafeId).setButton = "Yayınla";
    AdminUpdateOfferState(cafeId).offerTitleHintText = "Kampanya Başlığı";
    AdminUpdateOfferState(cafeId).offerDetailHintText = "Kampanta Detayı";
    AdminUpdateOfferState(cafeId).offerTagHintText = "Etiket";
    AdminUpdateOfferState(cafeId).descriptionHintText = "Ek Açıklama";
    AdminUpdateOfferState(cafeId).picturePathHintText = "Kampanya Resmi";
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }
}