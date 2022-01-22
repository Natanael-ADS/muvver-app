import 'package:muvver_app/modules/core/constant/image_const.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';

class MockInitSQLite {
  final transportModels = [
    TransportModel(id: 1, name: "Carro", pathImage: ImageConst.IC_CAR_2),
    TransportModel(id: 2, name: "Avião", pathImage: ImageConst.IC_AIRPLANE_2),
    TransportModel(id: 3, name: "Caminhão", pathImage: ImageConst.IC_TRUCK_2),
    TransportModel(id: 4, name: "Van", pathImage: ImageConst.IC_VAN_2),
    TransportModel(id: 5, name: "Moto", pathImage: ImageConst.IC_MOTORCYCLE_2),
    TransportModel(id: 6, name: "Bicicleta", pathImage: ImageConst.IC_BIKE_2),
    TransportModel(id: 7, name: "Trem", pathImage: ImageConst.IC_TRAIN_2),
    TransportModel(id: 8, name: "Ônibus", pathImage: ImageConst.IC_BUS_2),
    TransportModel(id: 9, name: "Embarcação", pathImage: ImageConst.IC_BOAT_2),
  ];
}
