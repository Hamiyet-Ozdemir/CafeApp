
import 'dart:io';
import 'package:cafeapp/Pages/Admin/AdminUpdateOfferPage/AdminUpdateOfferView.dart';

class OfferModel {

  void updateString(String docId,String cafeId, String offerTitle, String offerDetail,String offerTag, String description, File picturePath) {
    AdminUpdateOfferState.setButton = "Güncelle";
    AdminUpdateOfferState.docId = docId;
    AdminUpdateOfferState.offerTitleHintText = offerTitle;
    AdminUpdateOfferState.offerDetailHintText = offerDetail;
    AdminUpdateOfferState.offerTagHintText = offerTag;
    AdminUpdateOfferState.descriptionHintText = description;
    AdminUpdateOfferState.picturePathHintText = picturePath.toString();
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }

  void createString(String cafeId) {
    AdminUpdateOfferState.setButton = "Yayınla";
    AdminUpdateOfferState.offerTitleHintText = "Kampanya Başlığı";
    AdminUpdateOfferState.offerDetailHintText = "Kampanta Detayı";
    AdminUpdateOfferState.offerTagHintText = "Etiket";
    AdminUpdateOfferState.descriptionHintText = "Ek Açıklama";
    AdminUpdateOfferState.picturePathHintText = "Kampanya Resmi";
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }
}