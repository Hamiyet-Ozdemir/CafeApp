
import 'dart:io';
import 'package:cafeapp/Pages/Admin/AdminUpdateOfferPage/AdminUpdateOfferView.dart';

class OfferModel {

  void updateString(String docId,String cafeId, String offerTitle, String offerDetail,String offerTag, String description, File picturePath,String cafeName) {
    AdminUpdateOfferState.setButton = "Güncelle";
    AdminUpdateOfferState.cafeName=cafeName;
    AdminUpdateOfferState.docId = docId;
    AdminUpdateOfferState.offerTitleHintText = offerTitle;
    AdminUpdateOfferState.offerDetailHintText = offerDetail;
    AdminUpdateOfferState.offerTagHintText = offerTag;
    AdminUpdateOfferState.descriptionHintText = description;
    AdminUpdateOfferState.picturePathHintText = picturePath.toString();
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }

  void createString(String cafeId,String cafeName) {
    AdminUpdateOfferState.setButton = "Yayınla";
    AdminUpdateOfferState.cafeName=cafeName;

    AdminUpdateOfferState.offerTitleHintText = "Kampanya Başlığı";
    AdminUpdateOfferState.offerDetailHintText = "Kampanta Detayı";
    AdminUpdateOfferState.offerTagHintText = "Etiket";
    AdminUpdateOfferState.descriptionHintText = "Ek Açıklama";
    AdminUpdateOfferState.picturePathHintText = "Kampanya Resmi";
    AdminUpdateOfferState(cafeId).cafeId = cafeId;
  }
}