//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct PensionLocationParsingData: Decodable{
    let name: String
    let pensionOfNum: Int
    let sublocations: [Sublocation]
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case pensionOfNum = "pensions_length"
        case sublocations = "sublocations"
    }
    
    struct Sublocation: Decodable{
        let name: String
        let pensionOfNum: Int
        let sublocationNum: String
        
        enum CodingKeys: String, CodingKey{
            case name = "name"
            case pensionOfNum = "pensions_length"
            case sublocationNum = "sub_location_no"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decode(String.self, forKey: .name)
            pensionOfNum = try values.decode(Int.self, forKey: .pensionOfNum)
            sublocationNum = try values.decode(String.self, forKey: .sublocationNum)
        }
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        pensionOfNum = try values.decode(Int.self, forKey: .pensionOfNum)
        sublocations = try values.decode([Sublocation].self, forKey: .sublocations)
    }
}

struct PensionLocationData {
    var name: String
    var pensionOfNum: Int
    var sublocations: [pensionSubLocation]
    
    struct pensionSubLocation{
        var name: String
        var pensionOfNum: Int
        var sublocationNum: String
    }
}

struct PensionData: Decodable{
    let pensionPk: Int
    let pensionName: String
    let pensionImage: String
    let pensionLowestPrice: Int
    let pensionDiscountRate: Int
    let pensionLatitude: Double
    let pensionLongitude: Double
    
    enum CodingKeys: String, CodingKey{
        case pensionPk  = "pk"
        case pensionName = "name"
        case pensionImage = "pension_image_thumbnail"
        case pensionLowestPrice = "lowest_price"
        case pensionDiscountRate = "discount_rate"
        case pensionLatitude = "lat"
        case pensionLongitude = "lng"
    }
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pensionPk = try values.decode(Int.self, forKey: .pensionPk)
        pensionName = try values.decode(String.self, forKey: .pensionName)
        pensionImage = try values.decode(String.self, forKey: .pensionImage)
        pensionLowestPrice = try values.decode(Int.self, forKey: .pensionLowestPrice)
        pensionDiscountRate = try values.decode(Int.self, forKey: .pensionDiscountRate)
        pensionLatitude = try values.decode(Double.self, forKey: .pensionLatitude)
        pensionLongitude = try values.decode(Double.self, forKey: .pensionLongitude)
    }
}

struct PensionList{
    let pensionPk: Int
    let pensionName: String
    let pensionImage: String
    let pensionLowestPrice: Int
    let pensionDiscountRate: Int
    let pensionLatitude: Double
    let pensionLongitude: Double
    let pensionSubLocation: String
}

struct PensionDetailParsing: Decodable {
    let pk: Int
    let pensionName: String
    let pensionImage: String
    let pensionPrice: Int
    let pensionDiscountRate: Int
    let pensionLatitude: Double
    let pensionLongitude: Double
    let pensionAddress: String
    let pensionCheckInTime: String
    let pensionCheckOutTime: String
    let pensionPickUp: String
    let pensionRoomNumber: Int
    let pensionTheme: String
    let pensionCheckInOutDetail: String
    let pensionPickUpDetail:String
    let pensionGretting: String
    let pensionPrecations: String
    let pensionImages: Array<String>
    let pensionRoom: Array<pensionRoomDetail>
    
    enum CodingKeys: String, CodingKey {
        case pk = "pk"
        case pensionName = "name"
        case pensionImage = "pension_image_thumbnail"
        case pensionPrice = "lowest_price"
        case pensionDiscountRate = "discount_rate"
        case pensionLatitude = "lat"
        case pensionLongitude = "lng"
        case pensionAddress = "address"
        case pensionCheckInTime = "check_in"
        case pensionCechkOutTime = "check_out"
        case pensionPickUp = "pickup"
        case pensionRoomNumber = "room_num"
        case pensionTheme = "theme"
        case pensionCheckInOutDetail = "check_in_out_detail"
        case pensionPickUpDetail = "pickup_detail"
        case pensionGretting = "gretting"
        case pensionPrecations = "precations"
        case pensionImages = "pensionimages"
        case pensionRoom = "room"
    }
    
    struct pensionRoomDetail: Decodable{
        let roomPk: Int
        let roomName: String
        let roomSize: String
        let roomNormalNumPeople: Int
        let roomMaxNumPeople: Int
        let roomPrice: Int
        let roomStructure: String
        let roomEquipments: String
        
        enum CodingKeys: String, CodingKey{
            case roomPk = "pk"
            case roomName = "name"
            case roomSize = "size"
            case roomNormalNumPeople = "normal_num_people"
            case roomMaxNumPeople = "max_num_people"
            case roomPrice = "price"
            case roomStructure = "structure"
            case roomEquipments = "equipments"
        }
        init(from decoder: Decoder) throws{
            let values = try decoder.container(keyedBy: CodingKeys.self)
            roomPk = try values.decode(Int.self, forKey: .roomPk)
            roomName = try values.decode(String.self, forKey: .roomName)
            roomSize = try values.decode(String.self, forKey: .roomSize)
            roomNormalNumPeople = try values.decode(Int.self, forKey: .roomNormalNumPeople)
            roomMaxNumPeople = try values.decode(Int.self, forKey: .roomMaxNumPeople)
            roomPrice = try values.decode(Int.self, forKey: .roomPrice)
            roomStructure = try values.decode(String.self, forKey: .roomStructure)
            roomEquipments = try values.decode(String.self, forKey: .roomEquipments)
        }
    }
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pk = try values.decode(Int.self, forKey: .pk)
        pensionName = try values.decode(String.self, forKey: .pensionName)
        pensionImage = try values.decode(String.self, forKey: .pensionImage)
        pensionPrice = try values.decode(Int.self, forKey: .pensionPrice)
        pensionDiscountRate = try values.decode(Int.self, forKey: .pensionDiscountRate)
        pensionLatitude = try values.decode(Double.self, forKey: .pensionLatitude)
        pensionLongitude = try values.decode(Double.self, forKey: .pensionLongitude)
        pensionAddress = try values.decode(String.self, forKey: .pensionAddress)
        pensionCheckInTime = try values.decode(String.self, forKey: .pensionCheckInTime)
        pensionCheckOutTime = try values.decode(String.self, forKey: .pensionCechkOutTime)
        pensionPickUp = try values.decode(String.self, forKey: .pensionPickUp)
        pensionRoomNumber = try values.decode(Int.self, forKey: .pensionRoomNumber)
        pensionTheme = try values.decode(String.self, forKey: .pensionTheme)
        pensionCheckInOutDetail = try values.decode(String.self, forKey: .pensionCheckInOutDetail)
        pensionPickUpDetail = try values.decode(String.self, forKey: .pensionPickUpDetail)
        pensionGretting = try values.decode(String.self, forKey: .pensionGretting)
        pensionPrecations = try values.decode(String.self, forKey: .pensionPrecations)
        pensionImages = try values.decode(Array<String>.self, forKey: .pensionImages)
        pensionRoom = try values.decode(Array<pensionRoomDetail>.self, forKey: .pensionRoom)
    }
}

struct pensionDetailData {
    let pk: Int
    let pensionName: String
    let pensionImage: String
    let pensionPrice: Int
    let pensionDiscountRate: Int
    let pensionLatitude: Double
    let pensionLongitude: Double
    let pensionAddress: String
    let pensionCheckInTime: String
    let pensionCheckOutTime: String
    let pensionPickUp: String
    let pensionRoomNumber: Int
    let pensionTheme: String
    let pensionCheckInOutDetail: String
    let pensionPickUpDetail:String
    let pensionGretting: String
    let pensionPrecations: String
    let pensionImages: Array<String>
    let pensionRoom: Array<pensionRoomDetail>
    
    struct pensionRoomDetail{
        let roomPk: Int
        let roomName: String
        let roomSize: String
        let roomNormalNumPeople: Int
        let roomMaxNumPeople: Int
        let roomPrice: Int
        let roomStructure: String
        let roomEquipments: String
    }
}


let urlString = "https://www.pmb.kr/location/location-name/"
let pensionUrlString = "https://www.pmb.kr/location/"
var pensionLocationData = Array<PensionLocationData>()
var pensionData = Array<PensionList>()
var pensionDetailDataArray = Array<pensionDetailData>()
var pensionNum = 0


func fetchPensionAPI(){
    let url = URL(string: urlString)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let response = response as? HTTPURLResponse, let data = data else { return }
        guard 200..<400 ~= response.statusCode else {return}
        do{
            let pensionLocationParsingData = try JSONDecoder().decode([PensionLocationParsingData].self, from: data)
            
            for i in 0...pensionLocationParsingData.count-1{
                var pension = Array<PensionLocationData.pensionSubLocation>()
                
                for j in 0...pensionLocationParsingData[i].sublocations.count-1{
                    let pensionSub = PensionLocationData.pensionSubLocation.init(
                        name: pensionLocationParsingData[i].sublocations[j].name,
                        pensionOfNum: pensionLocationParsingData[i].sublocations[j].pensionOfNum,
                        sublocationNum: pensionLocationParsingData[i].sublocations[j].sublocationNum
                    )
                    pension.append(pensionSub)
                }
                let pensionLocation = PensionLocationData.init(
                    name: pensionLocationParsingData[i].name,
                    pensionOfNum: pensionLocationParsingData[i].pensionOfNum,
                    sublocations: pension
                )
                pensionLocationData.append(pensionLocation)
                pensionNum = pensionNum + pensionLocation.pensionOfNum
            }
            fetchPensionDataAPI()
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }
    dataTask.resume()
}

func fetchPensionDataAPI(){
    for i in 0...pensionLocationData.count - 1{
            for j in 0...pensionLocationData[i].sublocations.count - 1{
                let pensionSubLocationNum = pensionUrlString +  pensionLocationData[i].sublocations[j].sublocationNum + "/"
                let pensionURL = URL(string: pensionSubLocationNum)!
                
                let pensionDataTask = URLSession.shared.dataTask(with: pensionURL) { (data, response, error) in
                    guard let response = response as? HTTPURLResponse, let data = data else { return }
                    guard 200..<400 ~= response.statusCode else {return}
                    do{
                        print("start input data")
                        let pensionList = try JSONDecoder().decode([PensionData].self, from: data)
                       
                        for k in 0...pensionList.count-1{
                            let Pension = PensionList.init(
                                pensionPk: pensionList[k].pensionPk,
                                pensionName: pensionList[k].pensionName,
                                pensionImage: pensionList[k].pensionImage,
                                pensionLowestPrice: pensionList[k].pensionLowestPrice,
                                pensionDiscountRate: pensionList[k].pensionDiscountRate,
                                pensionLatitude: pensionList[k].pensionLatitude,
                                pensionLongitude: pensionList[k].pensionLongitude,
                                pensionSubLocation: pensionLocationData[i].sublocations[j].sublocationNum
                            )
                            
                            pensionData.append(Pension)
                        }
                        fetchPensionDetail()
                    } catch {
                            print("error : \(error.localizedDescription)")
                    }
                }
                pensionDataTask.resume()
            }
    }

}



func fetchPensionDetail(){
    //https://www.pmb.kr/location/1.001010/1/
    if pensionData.count == pensionNum{
        print(pensionNum)
        for i in 0...pensionData.count - 1{
            let pensionDetailURLString = pensionUrlString + pensionData[i].pensionSubLocation + "/" + String(pensionData[i].pensionPk) + "/"

            print("pensionDetailURL : \(pensionDetailURLString)")

            let pensionDetailURL = URL(string: pensionDetailURLString)!

            let pensionDetailDataTask = URLSession.shared.dataTask(with: pensionDetailURL){ (data, response, error ) in
                guard let response = response as? HTTPURLResponse, let data = data else{
                    print("error : response, data error")
                    return
                }
                guard 200..<400 ~= response.statusCode else {
                    print("sever error")
                    return
                }
                do{
                    let pensionDetail = try JSONDecoder().decode(PensionDetailParsing.self, from: data)
                    var pensionRoomListData = Array<pensionDetailData.pensionRoomDetail>()

                    for i in 0...pensionDetail.pensionRoom.count-1{
                        let pensionRoomData = pensionDetailData.pensionRoomDetail.init(
                            roomPk: pensionDetail.pensionRoom[i].roomPk,
                            roomName: pensionDetail.pensionRoom[i].roomName,
                            roomSize: pensionDetail.pensionRoom[i].roomSize,
                            roomNormalNumPeople: pensionDetail.pensionRoom[i].roomNormalNumPeople,
                            roomMaxNumPeople: pensionDetail.pensionRoom[i].roomMaxNumPeople,
                            roomPrice: pensionDetail.pensionRoom[i].roomPrice,
                            roomStructure: pensionDetail.pensionRoom[i].roomStructure,
                            roomEquipments: pensionDetail.pensionRoom[i].roomEquipments
                        )
                        pensionRoomListData.append(pensionRoomData)
                    }

                    let pension = pensionDetailData.init(
                        pk: pensionDetail.pk,
                        pensionName: pensionDetail.pensionName,
                        pensionImage: pensionDetail.pensionImage,
                        pensionPrice: pensionDetail.pensionPrice,
                        pensionDiscountRate: pensionDetail.pensionDiscountRate,
                        pensionLatitude: pensionDetail.pensionLatitude,
                        pensionLongitude: pensionDetail.pensionLongitude,
                        pensionAddress:  pensionDetail.pensionAddress,
                        pensionCheckInTime: pensionDetail.pensionCheckInTime,
                        pensionCheckOutTime: pensionDetail.pensionCheckOutTime,
                        pensionPickUp: pensionDetail.pensionPickUp,
                        pensionRoomNumber: pensionDetail.pensionRoomNumber,
                        pensionTheme: pensionDetail.pensionTheme,
                        pensionCheckInOutDetail: pensionDetail.pensionCheckInOutDetail,
                        pensionPickUpDetail: pensionDetail.pensionPickUpDetail,
                        pensionGretting: pensionDetail.pensionGretting,
                        pensionPrecations: pensionDetail.pensionPrecations,
                        pensionImages: pensionDetail.pensionImages,
                        pensionRoom: pensionRoomListData
                    )
                    pensionDetailDataArray.append(pension)

                } catch {
                    print("error : \(error.localizedDescription)")
                }
            }
            pensionDetailDataTask.resume()
        }
    }
}


fetchPensionAPI()



