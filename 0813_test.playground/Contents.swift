

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct PensionData : Decodable{
    let LocationName: String
    let sublocations: [PensionSublocation]
    
    enum CodingKeys: String, CodingKey{
        case LocationName = "name"
        case sublocations = "sublocations"
    }
    struct PensionSublocation: Decodable {
        let name: String
        let subLocationNumber: String
        let pensions: [PensionDetail]
        
        enum CodingKeys: String, CodingKey{
            case name = "name"
            case subLocationNumber = "sub_location_no"
            case pensions = "pensions"
        }
        
        struct PensionDetail: Decodable{
            let pk : String
            let pensionName: String
            let pensionImageURL: String
            let pensionLowestPrice: Int
            let pensionDiscountRate: Int
            let pensionLatitude: Int
            let pensionLongitude: Int
            
            enum CodingKeys: String, CodingKey{
                case pk = "pk"
                case pensionName = "name"
                case pensionImageURL = "pension_image_thumbnail"
                case pensionLowestPrice = "lowest_price"
                case pensionDiscountRate = "discount_rate"
                case pensionLatitude = "lat"
                case pensionLongitude = "lng"
            }
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                pk = try values.decode(String.self, forKey: .pk)
                pensionName = try values.decode(String.self, forKey: .pensionName)
                pensionImageURL = try values.decode(String.self, forKey: .pensionImageURL)
                pensionLowestPrice = try values.decode(Int.self, forKey: .pensionLowestPrice)
                pensionDiscountRate = try values.decode(Int.self, forKey: .pensionDiscountRate)
                pensionLatitude = try values.decode(Int.self, forKey: .pensionLatitude)
                pensionLongitude = try values.decode(Int.self, forKey: .pensionLongitude)
            }
        }
        init(from decoder: Decoder) throws{
            let values = try decoder.container(keyedBy: CodingKeys.self)
            name = try values.decode(String.self, forKey: .name)
            subLocationNumber = try values.decode(String.self, forKey: .subLocationNumber)
            pensions = try values.decode([PensionDetail].self, forKey: .pensions)
        }
    }
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        LocationName = try values.decode(String.self, forKey: .LocationName)
        sublocations = try values.decode([PensionSublocation].self, forKey: .sublocations)
    }
}

let pensionJson = """
[
{
"name": "가평",
"sublocations": [
{
"name": "남이섬/자라섬/가평북부",
"sub_location_no": "1.015002",
"pensions": [
{
"pk": 20,
"name": "가평 플로레스타펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22579/480x0/c046e245918b337c247ae9c611c162eb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=26c57373b987fe92d8f7b087010d35994d9351e2bcddcf542fe37e41f45a04e6",
"lowest_price": 160000,
"discount_rate": 0,
"lat": 37.856223,
"lng": 127.5440373
},
{
"pk": 19,
"name": "가평 팝펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21900/480x0/21d42f48e0ec1e868b9c260cef9c94db.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=94cec0cd043629cbfd1ea87694a3551d65d1358c89cd2f8b04afc86bbf932114",
"lowest_price": 100000,
"discount_rate": 9,
"lat": 37.9070374,
"lng": 127.4577293
},
{
"pk": 18,
"name": "가평 유앤아이펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21648/480x0/53aea15b095b2a2961e74a2b09709e9b.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4b289d7f5378a5acb9c2c9e0d21d19f94410e3e21b4c18dc865e505a86ad7eb2",
"lowest_price": 99000,
"discount_rate": 59,
"lat": 37.9070374,
"lng": 127.4577293
},
{
"pk": 17,
"name": "가평 해나펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25049/480x0/6fd9e596126b6e50f2053b4948ee23e0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=458314a3ccc356ac0ca8ff08e454ca3df001af994153f36c4716f0fdf1d6adcb",
"lowest_price": 89000,
"discount_rate": 27,
"lat": 37.869758,
"lng": 127.5414891
},
{
"pk": 16,
"name": "가평 이든펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22448/480x0/39b227e3b474e44891e61c9bcbcf741b.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=520b195bd9e360a1af3403a896ca2aa72b83b6c150f74c926860c99bc3c86961",
"lowest_price": 119000,
"discount_rate": 32,
"lat": 37.9794527,
"lng": 127.4282149
},
{
"pk": 15,
"name": "가평 사랑그리기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20925/480x0/2cddeed07d7bbc86d4352c2d38f10ec6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0c6714d68f05ab27408f4ef39c18c82c78d8b37387d422a90777a311b5ec4ac5",
"lowest_price": 140000,
"discount_rate": 18,
"lat": 37.8993271,
"lng": 127.53817
},
{
"pk": 14,
"name": "가평 풀빌라아쿠아밸리",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19601/480x0/d2b81f749c52d997c3ba6088a52d3bba.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022906Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=96cdd2cb962424b52263601b064e3521dd0f78951de9cd19dc162d58beb13ba3",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.8159375,
"lng": 127.4617405
},
{
"pk": 13,
"name": "가평 폴라리스펜션[17.11월리모델링]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24127/480x0/53c4b7187fffcd427d14dd22cfc831bb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=556ee80f731e3bf9b9de750c53e04d635ad0cf24bd4d292aca74f9dca15ac230",
"lowest_price": 84000,
"discount_rate": 7,
"lat": 37.8976702,
"lng": 127.4901877
},
{
"pk": 12,
"name": "가평 미뇽의숲펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21818/480x0/9721f244a8bdd0629ed4866a445b84f0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c7ed1b3c7e6d5681debaeba6f69f5d07e220952405969feba3c0424e809e8845",
"lowest_price": 79000,
"discount_rate": 34,
"lat": 37.9010308,
"lng": 127.4827439
},
{
"pk": 11,
"name": "가평 씨엘펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22154/480x0/e7d09edce291ae73f449d278d09b7dc2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0aff88c6d98408f479e1eea546b5263f18d84674cec9c0b9c0f849160fd29e21",
"lowest_price": 120000,
"discount_rate": 24,
"lat": 37.8150913,
"lng": 127.4676447
},
{
"pk": 10,
"name": "가평 풀빌라펠리스[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21996/480x0/72aa82787732b76b280aa9048c9a552d.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ab0cbc2fca93ee2fae5afe161a2bd436aa72839abf73b561593178408e7c3885",
"lowest_price": 279000,
"discount_rate": 7,
"lat": 37.8228855,
"lng": 127.4358713
},
{
"pk": 9,
"name": "가평 블루펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22331/480x0/7a9b8695b0f5a681e86b4bc071b77f65.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2bd04a61b0afda4a6ead0f2910076a67fee64c28af4dd9d5cba1a59cd5eca5a0",
"lowest_price": 105000,
"discount_rate": 22,
"lat": 37.9086982,
"lng": 127.5745958
},
{
"pk": 8,
"name": "가평 메종드파티오펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26104/480x0/2c11730855d866f200c2118e41af8dd6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2f279ccaf4f8d97feffe659c5bee92888ec7ed46afdd98433fbe4363538275e3",
"lowest_price": 160000,
"discount_rate": 0,
"lat": 37.8155978,
"lng": 127.4533189
},
{
"pk": 7,
"name": "가평 엘리에셀펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25830/480x0/d771e26185e9e21bd1748981e5c46a06.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e59d62b47566e7eaccd06feab681a2b637ead6e8b0b4814b23d4541b6d459d72",
"lowest_price": 79000,
"discount_rate": 22,
"lat": 37.7513972,
"lng": 127.5296483
},
{
"pk": 6,
"name": "가평 레드펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21251/480x0/50d227266a46e42127c21b52796bbd7b.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a38a0045393c55fa520c975a51b5ba5c00f50b65d74c6c960f485ba215dab63a",
"lowest_price": 170000,
"discount_rate": 11,
"lat": 37.8151941,
"lng": 127.4674805
},
{
"pk": 5,
"name": "가평 로제펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22104/480x0/a16d17fdd18de443f7779d748321dba2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1eaddb1bf5fa87e2f5035b4fe2aa27403f5281efe25835ca798c760b1cf74991",
"lowest_price": 130000,
"discount_rate": 19,
"lat": 37.8148002,
"lng": 127.4676298
},
{
"pk": 4,
"name": "가평 여우가달을사랑할때글램핑펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22299/480x0/6d24abf05bc32d7605217abd4ce89333.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=814ee2cbdf7d18a2ecf519cda4eba3a3ecce0b2cc9ea1f0944cd21f0c034df39",
"lowest_price": 189000,
"discount_rate": 0,
"lat": 37.8122519,
"lng": 127.4304088
},
{
"pk": 3,
"name": "가평 달빛누리펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22067/480x0/7e7a1a31a651cb29f71bfe9c999c97a2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=40328161e91b385982bdff82889b5501d8f91b401483ef5c506fedf9f33be008",
"lowest_price": 99000,
"discount_rate": 53,
"lat": 37.9070374,
"lng": 127.4577293
},
{
"pk": 2,
"name": "가평 로렌시아펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21535/480x0/a2fec8f65cba1c388aec8c25da56efab.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=59540e9a8e9693bcfd3bd2d98733fa55bd97c32bd4aa6d4777753d331077dd43",
"lowest_price": 92000,
"discount_rate": 56,
"lat": 37.899186,
"lng": 127.4532835
},
{
"pk": 1,
"name": "가평 춘향이와방자펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22298/480x0/306f682ab5aa3d888ddeb752e9989bf4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f04f293ebe8966a9eeadc12e75d1f00e507dfc0ea87eeadeeba341f32a3a1ad8",
"lowest_price": 199000,
"discount_rate": 0,
"lat": 37.9137075,
"lng": 127.5896846
}
]
},
{
"name": "아침고요수목원/쁘띠프랑스/청평",
"sub_location_no": "1.015003",
"pensions": [
{
"pk": 40,
"name": "가평 캡틴카라반글램핑펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31175/480x0/922f82771633a66962c3c49afce1c85d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0526125afc51f84221984e9673e663d7a3ad80bb81811290bc958fc303bf6a02",
"lowest_price": 59000,
"discount_rate": 0,
"lat": 37.7806833,
"lng": 127.371353
},
{
"pk": 39,
"name": "가평 행복펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21380/480x0/cd63482a03b3674add8c1546e6074fe4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=fce832cb2baaf7f46390d1fd3cb4c560fb0610374079f4338aed84f91abb9c08",
"lowest_price": 75000,
"discount_rate": 0,
"lat": 37.7668714,
"lng": 127.3634589
},
{
"pk": 38,
"name": "가평 별이빛나는호수펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23298/480x0/7a2436767ec27f0f7a99a38d4c3e0d3e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=37e4abad3287958bf804b969c558ea6fbb871fa3f215e3c1a1e4df35610da797",
"lowest_price": 65000,
"discount_rate": 0,
"lat": 37.7773388,
"lng": 127.4510029
},
{
"pk": 37,
"name": "가평 아스테리아펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20026/480x0/296acf3cc234f1c37316a0397263fde5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9942a76d2e232eaff05b91a00a9d15c848f579fd18764d3534a1c4f366b7f2fd",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.7720643,
"lng": 127.394094
},
{
"pk": 36,
"name": "가평 샘물향기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25580/480x0/ad12f05c66313fbb0e3bf85679839b51.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=7426a649fa38bec69667317eea5d12471e00f2d748d646634e49f627d7292ad2",
"lowest_price": 89000,
"discount_rate": 35,
"lat": 37.789459,
"lng": 127.435058
},
{
"pk": 35,
"name": "가평 라포레펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19681/480x0/00dfd6431c98fc8de49b52e69f75b25d.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=17aa473451473fe7df0b467111afd685417c3d3f23ae061d82907390d818fff8",
"lowest_price": 129000,
"discount_rate": 14,
"lat": 37.6932695,
"lng": 127.4604865
},
{
"pk": 34,
"name": "가평 나르샤의정원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23426/480x0/72d6d8f4f17cacf964fb9eda47cd521d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e0ca4c752f642e3d754e0178bb986cedeb1b7115d8d5c7214d0eb942eaf79d68",
"lowest_price": 119000,
"discount_rate": 38,
"lat": 37.7567706,
"lng": 127.3751847
},
{
"pk": 33,
"name": "가평 유명산장라벨르펜션[MD추천,전객실애견동반]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22736/480x0/431379d8831fa592df83fa14eacede9e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=68e764a06239810b6bf843ad7d166957f262b3b3db4532442f432e860099d6b6",
"lowest_price": 219000,
"discount_rate": 12,
"lat": 37.7658286,
"lng": 127.4262147
},
{
"pk": 32,
"name": "가평 언덕위에푸른집펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20384/480x0/9e287bb050af4919bcdc3b36f52eaf9f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d76296b06fb93e37b26d046aab4c7af6769ed3d94cd57c6544c7d78017cf9701",
"lowest_price": 249000,
"discount_rate": 8,
"lat": 37.7673025,
"lng": 127.3971192
},
{
"pk": 31,
"name": "가평 청평몽마르뜨펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20381/480x0/700d4fb48c8fd7dc577b647f9b4e5795.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=68e8c19ebe7b0e5c1a55b5b4310de3adb9208379bbe9f50611198e3941154eb2",
"lowest_price": 120000,
"discount_rate": 22,
"lat": 37.7670679,
"lng": 127.3972357
},
{
"pk": 30,
"name": "가평 모닝필하우스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20376/480x0/76ede20d43de41c77114fe01988d8293.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=10e186274e5ccadc84a9290fc2705e9b7eee41809e7566398264223e2c15e6d6",
"lowest_price": 140000,
"discount_rate": 0,
"lat": 37.7667341,
"lng": 127.3966232
},
{
"pk": 29,
"name": "가평 해뜨는숲속펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22180/480x0/763e5e58887077ee2b7c3393daaf2f13.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2cc4e9d9572369b98fcfc2a5c15d394455b9ad7a4c5118175e29d4914a2f845b",
"lowest_price": 120000,
"discount_rate": 33,
"lat": 37.766715,
"lng": 127.3972919
},
{
"pk": 28,
"name": "가평 애플밸리펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22102/480x0/97e49fdce0b9f1c8457ed7e2b4b38687.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=68b6aff182ac4f0057b3c35d4dbff5c69c8c75d38ea62e4c6697713fde94c3cf",
"lowest_price": 149000,
"discount_rate": 21,
"lat": 37.7541659,
"lng": 127.3589558
},
{
"pk": 27,
"name": "가평 청평플로리안펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21084/480x0/ef3af0902df89558433b2cf5ea6b8715.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=eeb103575134e1438ddccaeb0b63b74592ed11b3ea386957ca1b4e5e5266b191",
"lowest_price": 168000,
"discount_rate": 28,
"lat": 37.7666344,
"lng": 127.3970338
},
{
"pk": 26,
"name": "가평 청평프라하펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20632/480x0/2ed9f4095c64a0cd2174eb68c3f457ae.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5b5eae918739e12629e96bf333e20255d236af1fe4c5b2706cb1dc17e9236bc1",
"lowest_price": 126000,
"discount_rate": 30,
"lat": 37.7674989,
"lng": 127.3969462
},
{
"pk": 25,
"name": "가평 하늘소플러스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21100/480x0/c9bda3bff3e40426d6091f59abb3642a.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c9d1ed8326199ce97272f6e093bee66db5ea71393f536a37191b36be8655ad03",
"lowest_price": 78000,
"discount_rate": 32,
"lat": 37.7585987,
"lng": 127.3618864
},
{
"pk": 24,
"name": "가평 리버빌펜션[리버뷰]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19679/480x0/efc26ae8971168e54ea3922150db910d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=238c5c9b55c134c6b1158eb10fa7a7d0589b625932fd35f49e681c1cf16f7d67",
"lowest_price": 150000,
"discount_rate": 34,
"lat": 37.7082141,
"lng": 127.448387
},
{
"pk": 23,
"name": "가평 휴910펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26018/480x0/dca06d602622611303605b336c57e828.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1f78c455ad73deb84de29704d8405b8b1edf72a189283818a7642e40f54ef2d1",
"lowest_price": 119000,
"discount_rate": 30,
"lat": 37.7608503,
"lng": 127.4840727
},
{
"pk": 22,
"name": "가평 슐라프라움풀빌라펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27334/480x0/2b09b73743e763cfdf2a21b3c329ebe1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=883247a51902e54b0bc0f85f04f07731924aab84b6cfb6d907876d3dd380f9d4",
"lowest_price": 350000,
"discount_rate": 0,
"lat": 37.7845592,
"lng": 127.3208096
},
{
"pk": 21,
"name": "가평 디오르풀빌라",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21790/480x0/bb32280ff6f4b3715390528c303a7189.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=fd958264d54b58618fa5e9fb402e82450754b6b06f40c917dd894ebee6610839",
"lowest_price": 119000,
"discount_rate": 11,
"lat": 37.7508408,
"lng": 127.3635542
}
]
}
]
},
{
"name": "경기",
"sublocations": [
{
"name": "양평",
"sub_location_no": "1.001010",
"pensions": [
{
"pk": 60,
"name": "양평 레몬그라스펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22260/480x0/5549693a559a725462e3dfa40b82f8d8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b6efb4b275b034753af93d2dd1a968fe3eec7e0fd6cbc6b2a87ed456400a1fd2",
"lowest_price": 89000,
"discount_rate": 11,
"lat": 37.6178495,
"lng": 127.6310262
},
{
"pk": 59,
"name": "양평 태양펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19851/480x0/e2ea659d2edf108794618a981126f09d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=03ee2c768ec6852bd77b4ee9418d3a919b6dec6075f655e0862cd62e16743b0a",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.5850245,
"lng": 127.394901
},
{
"pk": 58,
"name": "양평 별과풍차펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20101/480x0/6ef80ca333874ec28aabdace1d7b6380.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=058744352f2f4ea461f01f3618e0f9d8deb8cb429ca576a71e24740e27f7dcc1",
"lowest_price": 117000,
"discount_rate": 10,
"lat": 37.5294391,
"lng": 127.7667379
},
{
"pk": 57,
"name": "양평 쁘띠펜션[단독특가]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21281/480x0/3e65409c734eed99a69a15bdf993bc45.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8c5f529972c5a7ea86fe95872f1ec5bdec1dff436aab66d39a459927d14161a1",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.5846879,
"lng": 127.45667
},
{
"pk": 56,
"name": "양평 아바타펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20265/480x0/1981d1800c834a7f441012fa585bbaec.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bfaf0eeafba1ffa8891f11565431b3e9ae5167bce24b0e2f380e74023886a1ab",
"lowest_price": 150000,
"discount_rate": 0,
"lat": 37.6179371,
"lng": 127.3567096
},
{
"pk": 55,
"name": "양평 이솝이야기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20356/480x0/9eb595bfa1a11ac8bee2118c8515e3fa.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0c79d80d390918f903e28db022e446c175edc886b1f603aed62aa101f460c396",
"lowest_price": 139000,
"discount_rate": 18,
"lat": 37.5352348,
"lng": 127.6381899
},
{
"pk": 54,
"name": "양평 세레나데펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19833/480x0/8a5af52b35efc1d5e4f4ba750ee13fa1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e4b0912a47813408480e103f9b6f10d697af6a4db69ed60810f622f52b789c6c",
"lowest_price": 80000,
"discount_rate": 38,
"lat": 37.6024368,
"lng": 127.3969028
},
{
"pk": 53,
"name": "양평 솔마루펜션[단독특가]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22015/480x0/c942985d9ba572917a5f44f28decddbb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ebfedcc6c23f1543c977bce98422d952f167c77934931dab75046e13aa2b04e4",
"lowest_price": 120000,
"discount_rate": 40,
"lat": 37.5886802,
"lng": 127.416946
},
{
"pk": 52,
"name": "양평 하늘빛펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21394/480x0/53221a0364281766a3db76e9a4b5823e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ecfa71bbe1769498fd7071d01637f03b2a42255befb42b66bd5cfb93843ea888",
"lowest_price": 99000,
"discount_rate": 50,
"lat": 37.5294391,
"lng": 127.7667379
},
{
"pk": 51,
"name": "양평 미끄라트펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22258/480x0/f48cd86c8798a81550be0b77289556d2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=aada7f47165966e9d51a0c0da5513420cd22a779c10494e41190cb8bc50109bf",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.6204975,
"lng": 127.6326908
},
{
"pk": 50,
"name": "양평 베아트리체펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25635/480x0/2f1d385af70b5ce900d7517784b1a05c.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3a987d4ad4565d154c86e9c5b9bf85c4eac373000040d6c67817c7905ea63eb5",
"lowest_price": 140000,
"discount_rate": 0,
"lat": 37.464278,
"lng": 127.601095
},
{
"pk": 49,
"name": "양평 랏지하우스펜션[단독판매]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23468/480x0/5a36f5b8f8adbb53192ce4d3059d3943.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=65ec6569c7d3fe7d0e152f490bc3f340dfdad85077548086581f42c99ac824c9",
"lowest_price": 50000,
"discount_rate": 5,
"lat": 37.6362615,
"lng": 127.4265508
},
{
"pk": 48,
"name": "양평 플러스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26034/480x0/b416b8469fd612e5b94d27cbb959face.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4cfeb7ceb4dfb44461c60a657b796fe79c4a6bbfdc52d96f47157330475f02ee",
"lowest_price": 80000,
"discount_rate": 43,
"lat": 37.5949906,
"lng": 127.4361104
},
{
"pk": 47,
"name": "양평 라떼펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21391/480x0/47d76a659cb26694e3cb41ecbd21201d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8a67937f37c0bcd7dc0fb231a2af9a56e9c0afda4d81766401b468f14ab30621",
"lowest_price": 90000,
"discount_rate": 0,
"lat": 37.6382614,
"lng": 127.3959629
},
{
"pk": 46,
"name": "양평 바람이불어꽃이되다펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25202/480x0/3dfb0419b4e200864ed8aadbc8431a53.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9bb0b9d29fc2c37c28d6d40be20433e4e9866ee87f553581c14974412d6fa51c",
"lowest_price": 119000,
"discount_rate": 21,
"lat": 37.6033828,
"lng": 127.3984762
},
{
"pk": 45,
"name": "양평 자연이야기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21395/480x0/6e069e54975cf048894ade62680fee5f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3a4ba0f0bbb1133684fcc470f31c5f059b38a3ea73a32976f255aeb17cf8ce51",
"lowest_price": 90000,
"discount_rate": 40,
"lat": 37.6118514,
"lng": 127.4210942
},
{
"pk": 44,
"name": "양평 스마일펜션[애견펜션]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19891/480x0/f316c000a01f6b77235631382bcc6c96.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a18da995e14c69a03b0b880707683bf5f078866266e201c195401fd1769bf89a",
"lowest_price": 110000,
"discount_rate": 0,
"lat": 37.6463611,
"lng": 127.6161774
},
{
"pk": 43,
"name": "양평 오즈펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21492/480x0/04bc8c4983fed75d9d72777d147c31e4.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ac77f2b6f47244fba1871f4c447b5403f9cde17af012cbf778301f37dc582ea5",
"lowest_price": 89000,
"discount_rate": 18,
"lat": 37.6024902,
"lng": 127.385235
},
{
"pk": 42,
"name": "양평 블루밸리펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24662/480x0/e16271e2ac038a1583d4acc067f4f103.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9e64265b7f5939dbf7de9c3516572f3473fdad88947890bbb2bac58c51ab0a48",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.5825871,
"lng": 127.3991372
},
{
"pk": 41,
"name": "양평 블러썸스파펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28325/480x0/ad5de42d5e611ae4e4d11ca40ed07164.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=50312f7bd82dcf6c71ed92e2d8dffb5456d8f9728669b9920d3dee24e95e4e25",
"lowest_price": 89000,
"discount_rate": 11,
"lat": 37.6017107,
"lng": 127.3962178
}
]
},
{
"name": "대부도",
"sub_location_no": "1.001005",
"pensions": [
{
"pk": 80,
"name": "대부도(선재도) 향기나는펜션[18년.6월 신축]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22699/480x0/fbb20185b997c21e2dd879d2ad9dca79.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=eb1d55753eeeacc16564cb9c70fbe688c5bb5da5ca3c2a092c5ada78946dc08a",
"lowest_price": 90000,
"discount_rate": 36,
"lat": 37.2342802,
"lng": 126.5341263
},
{
"pk": 79,
"name": "대부도(선재도) 갤러리스파펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22360/480x0/9ddc3e8b972c913e19b1cb21ad9cdd68.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=be7a5883dd8d82775a24268811ca8c9a0e3a4b171432086a03683a3705afc284",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.234707,
"lng": 126.5345118
},
{
"pk": 78,
"name": "대부도(선재도) 일루아펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20698/480x0/511eed6acf302bba976b3e98b96bea10.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1f895c0c1e8147da7f7c31c94bd9e4434ec45adfa3933adf602999de61552cb9",
"lowest_price": 209000,
"discount_rate": 5,
"lat": 37.2452328,
"lng": 126.530411
},
{
"pk": 77,
"name": "대부도(선재도) 목섬화이트펜션[17년신축,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25591/480x0/7ae7c2b67f4500974af57a36438fc3d7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9be3a57c06580a580feca55ef8ad32c47cf54f149533ce9bbe553ba0f1c19f12",
"lowest_price": 199000,
"discount_rate": 10,
"lat": 37.2526067,
"lng": 126.5232436
},
{
"pk": 76,
"name": "대부도 애플스파펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20405/480x0/01feaf572f89bcf38b323962cf488608.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=55a90c35dad118fba0589759bc4ce822ad5f0c9272cc8b422b00ffcd2bc89cf3",
"lowest_price": 99000,
"discount_rate": 17,
"lat": 37.2568701,
"lng": 126.5173564
},
{
"pk": 75,
"name": "대부도(영흥도) 세라핌펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22610/480x0/7c20d3d4deaec8354eef25c5187ffd0a.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1837deee0df01c42631146f757bce6ae8d2a4bcc90f1c0c064025b97cbad3427",
"lowest_price": 140000,
"discount_rate": 0,
"lat": 37.2688539,
"lng": 126.4708583
},
{
"pk": 74,
"name": "대부도(영흥도) 블루스토리펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20409/480x0/696d9b0d023a98934ccf237a415c6f7f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ea0d2bf18f08af37260fc10204263fa531abd70be08fbf5d3f04d7a79564a847",
"lowest_price": 169000,
"discount_rate": 6,
"lat": 37.2401859,
"lng": 126.4717736
},
{
"pk": 73,
"name": "대부도(영흥도) 소풍재펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20578/480x0/d1395fb941ab7954c3c3797733d50ee3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1e2a04c35c6369f589371f9f7be872ef2e62e76519cd3f9a923ae636686e2aee",
"lowest_price": 149000,
"discount_rate": 17,
"lat": 37.266575,
"lng": 126.4485364
},
{
"pk": 72,
"name": "대부도(영흥도) 미림펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24255/480x0/0d8597c3a15c09562863fbe023ccaaa9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1262b3bdbc339b3e965a457ec71431121ffc1e2bac6591784ef4e7c5dec894c4",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.254812,
"lng": 126.498675
},
{
"pk": 71,
"name": "대부도 걸리버여행기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20278/480x0/ebfbb4003ff101a8594f9e3dd82f1004.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0d3a9b8d272f267e41a0d0d2e6f7be85d17ac9c59e9faa1afdd19ab9dc9ec889",
"lowest_price": 280000,
"discount_rate": 0,
"lat": 37.2811257,
"lng": 126.5525275
},
{
"pk": 70,
"name": "대부도 아라펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25605/480x0/5077495906f88c1c2226d297393f399e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1cd768269a05f512bc8609876b420e55db52a7a68b4056ae8191f9eab9f380e8",
"lowest_price": 150000,
"discount_rate": 0,
"lat": 37.2816756,
"lng": 126.5536692
},
{
"pk": 69,
"name": "대부도(영흥도) 전망좋은통나무집펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26500/480x0/626d82ba32f84d0b0977c2e0b8fbe5b3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=631b8c4c7cda62f4d4f81836619017eb5921a036358b50b919614e26b73b465d",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.2688539,
"lng": 126.4708583
},
{
"pk": 68,
"name": "대부도(선재도) 가와라우펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21527/480x0/f165a26157195ed2de169a3b1db46f66.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=7b961aaaeda361eccacaeb672195b193a8a645f7019b721e46b7dd9f564fbe19",
"lowest_price": 110000,
"discount_rate": 0,
"lat": 37.2526067,
"lng": 126.5232436
},
{
"pk": 67,
"name": "대부도(영흥도) 오블리크198풀빌라펜션[17.7월신축]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26620/480x0/8ad8f2acec41d10540aa9dddf2452d56.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=20c86204baf13cdc997865f46f23a55d929aa01255e8243958f52d9176b9827b",
"lowest_price": 350000,
"discount_rate": 0,
"lat": 37.2688539,
"lng": 126.4708583
},
{
"pk": 66,
"name": "대부도(영흥도) 노을&바다펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22207/480x0/79d1842fe498238ab324d8eaf02103f2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=60dfd7eaeecf2c8a7c9857f90b09c06b70de23329745f10912d50d71bdbda009",
"lowest_price": 90000,
"discount_rate": 0,
"lat": 37.2793107,
"lng": 126.4570561
},
{
"pk": 65,
"name": "대부도(영흥도) 화가의마을펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21795/480x0/195bca460b363d789146fc7de9f23756.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=51c16506841e536acc4eb15116c187da4d354cc93297e7d114e78b102b136c5e",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.2688539,
"lng": 126.4708583
},
{
"pk": 64,
"name": "대부도(선재도) 종이학펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20883/480x0/a77d80745b39946a8616220582f22b3f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=020b4d2b9628c18a538f035c5c0a8a3c04a6855e7c457408e7579775acc1dfd3",
"lowest_price": 114000,
"discount_rate": 40,
"lat": 37.2480657,
"lng": 126.5258836
},
{
"pk": 63,
"name": "대부도(영흥도) 모래시계펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22439/480x0/0b3c7a29b16d8100af8f83e4f6b5e2f2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4adb31547d0674b00c2bc9ca8b80fe79457391b82037835286ee51ec9f38df3f",
"lowest_price": 90000,
"discount_rate": 0,
"lat": 37.2786494,
"lng": 126.4567958
},
{
"pk": 62,
"name": "대부도 이데아펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22383/480x0/be9f9dd215bdb4621bcba041e53ae7f0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2c1d099f99896523f005c7740a3cd831ab681fbefd177a988256f605f5e174f1",
"lowest_price": 129000,
"discount_rate": 20,
"lat": 37.258289,
"lng": 126.5731267
},
{
"pk": 61,
"name": "대부도(영흥도) 영흥도관광펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26645/480x0/ac404deb4edae70344993a79145dbb18.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bf5cfb72cf187e1b1b5d8728e0c97a600ececcf4eb46c37b6496e4386f6affd0",
"lowest_price": 110000,
"discount_rate": 45,
"lat": 37.2688539,
"lng": 126.4708583
}
]
},
{
"name": "포천",
"sub_location_no": "1.001016",
"pensions": [
{
"pk": 100,
"name": "포천 해뜨는언덕펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19889/480x0/c7b419798c992f305fbfa506b2fb0373.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4e868508986e0e3b6ad7b579e653f8afa59ef04841307ea926625255488c6786",
"lowest_price": 95000,
"discount_rate": 0,
"lat": 37.923106,
"lng": 127.169487
},
{
"pk": 99,
"name": "포천 코지11펜션[단독최저가][17년신축]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25731/480x0/40c2e31f84529afa078d58c559e16453.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bcc2370225224f1990011c8e36da33ee5672351477dfeeb58593f4ca4172ed92",
"lowest_price": 135000,
"discount_rate": 0,
"lat": 37.9227499,
"lng": 127.1698368
},
{
"pk": 98,
"name": "포천 펜션빌라지오",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24220/480x0/100b8d9eb90fab6b292771967a298366.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=dce92e8e6baf29a7a26075a8ac50e5bffb36223f6a56e65b7d8c14502d0839b4",
"lowest_price": 154000,
"discount_rate": 30,
"lat": 38.0757063,
"lng": 127.4032977
},
{
"pk": 97,
"name": "포천 별빛연가펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22551/480x0/3e0fed48dd52bed7124cab0de4b12a1e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c2dcff8e7b396bf96c355da5cc50b0ee4980c0496a00224e8910d2a14779eef7",
"lowest_price": 109000,
"discount_rate": 27,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 96,
"name": "포천 소담스파펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22499/480x0/6d0c10d3b67a8d2a17cbc793bce24dbf.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=816e5fd43b191b5f9bc09370b09032be7d7a360d212e174f619bea1896738a23",
"lowest_price": 109000,
"discount_rate": 27,
"lat": 38.0687383,
"lng": 127.3062535
},
{
"pk": 95,
"name": "포천 포레스트풀빌라&스파[키즈풀빌라오픈,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26030/480x0/c51055bdd6bc79d7ba5ae9f4f2bce51f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=263ce0476747928dc861d6d0ecee40548071a28e6356f5fe5c94b053cc4f150b",
"lowest_price": 239000,
"discount_rate": 4,
"lat": 37.9735829,
"lng": 127.2775638
},
{
"pk": 94,
"name": "포천 May.B풀빌라&스파[사계절수영장,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25818/480x0/623c6352f75a94d2e8d995e36e2ed513.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6d1e851a6a1e8e72a81e05feb1317c58f3c9ff16d3d71eb7a3750a57a2f0e0ba",
"lowest_price": 179000,
"discount_rate": 15,
"lat": 38.0703401,
"lng": 127.3047008
},
{
"pk": 93,
"name": "포천 럭스제이키즈&스파펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26631/480x0/b1f009ab5d96b73dae387199f8282128.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2d43422f7004ff5907c57e0fab29957c1ddab7c392adb61d494ac50d02ed6ce3",
"lowest_price": 229000,
"discount_rate": 5,
"lat": 38.0596197,
"lng": 127.3303653
},
{
"pk": 92,
"name": "포천 화적연펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26763/480x0/58db0c7fade9e6f045bceeaa597599fe.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f10644088488b5cdf80ffa2321a3455a1a7e0d66de1d78c6a7aa855d4867c577",
"lowest_price": 130000,
"discount_rate": 10,
"lat": 38.1199594,
"lng": 127.2704742
},
{
"pk": 91,
"name": "포천 풀빌라아띠랑스",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25683/480x0/385d64e8a10a72f963bb0a5e3b8240e2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8926710f8a6f85cc48684589ee1a57f69a72fa30bc10a06adca40f48cbb8722e",
"lowest_price": 279000,
"discount_rate": 38,
"lat": 38.0612025,
"lng": 127.3150056
},
{
"pk": 90,
"name": "포천 춘화원한옥호텔형스파펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23992/480x0/0dd72b86c1127002b456eecbd7c096bb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=210de89ae038c713a28442887d2c3a85981525a37a2d8a822bbdb1da9008d462",
"lowest_price": 99000,
"discount_rate": 67,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 89,
"name": "포천 하이엔드빌리지펜션 [MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26750/480x0/294957feff26e422bd468f0108a4fae0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f009f49bfc87ea1140f88779f4e3562fc6a04c819f863a4afa754d6fbec35e98",
"lowest_price": 149000,
"discount_rate": 7,
"lat": 38.0659809,
"lng": 127.3236845
},
{
"pk": 88,
"name": "포천 별헤는호수펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20956/480x0/d426b122489eea37027a4eb3be5575fb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1d71cb59606a11e83c0b64f68c3d606c8892206809e6f715a6b92448a23b0c57",
"lowest_price": 117000,
"discount_rate": 10,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 87,
"name": "포천 더샵스파펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27471/480x0/d7eb050146a419f425c031ff3fb8a92a.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=03e04b9b742fdbb66c26c09b788f5d6b15dffb234d0fe988fc9c5720d1f68213",
"lowest_price": 129000,
"discount_rate": 19,
"lat": 37.9740213,
"lng": 127.2777963
},
{
"pk": 86,
"name": "포천 로하스펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22208/480x0/a20bce6209cb0177e3009e53e1eec3b6.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a4cd9372afa79af0f305c53c2c910277bb2baf078935a79e6092d45cea6df22a",
"lowest_price": 125000,
"discount_rate": 17,
"lat": 37.8628845,
"lng": 127.2777764
},
{
"pk": 85,
"name": "포천 조이토마토펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23200/480x0/2b55adefd284c8151e08ab4dfae4e294.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=53ba2f0232c50daaea3ff550ab8894757358d99ae118d173fbf11daadfbbbbcc",
"lowest_price": 69000,
"discount_rate": 22,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 84,
"name": "포천 라비앤로즈펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26994/480x0/7ae4c1f6d31ee8d12be07e075b48a7b1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3dff1990d3725ad553844ad313edfd43fefa1333a1e3ecbfb87700f879930b47",
"lowest_price": 109000,
"discount_rate": 0,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 83,
"name": "포천 테라스가아름다운집펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20394/480x0/6bb9edbf3db82a646efd93c5c018327c.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5c477f837c7d84c5f9bbca593c072c9c7a9a05361db04c3d16559f4c4addaa9f",
"lowest_price": 105000,
"discount_rate": 30,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 82,
"name": "포천 빈센트하우스펜션[18.5월신축,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27993/480x0/24ef3a483ffa24be6608e9cbad86af5a.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=eae986462432aba28e0540acd3f0887a1c209dbf77414641cfb9ba3a8e817355",
"lowest_price": 129000,
"discount_rate": 19,
"lat": 37.9453486,
"lng": 127.3280668
},
{
"pk": 81,
"name": "연천 스텔라토풀빌라&스파[17.7월신축,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25601/480x0/017bdc101a63117dd4660696482e5c08.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b6c903e1473dd8cd4b472e22a7a6cea1ed0902c9d4ea2f3dd8cceceedd6e7dd9",
"lowest_price": 359000,
"discount_rate": 8,
"lat": 38.0109236,
"lng": 127.0683748
}
]
},
{
"name": "남양주",
"sub_location_no": "1.001006",
"pensions": [
{
"pk": 120,
"name": "남양주 까사스페이스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22255/480x0/07e3c851cbd321c825f10569502fb275.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bfdee3ecb659ea74c59406f1d4a35bfce9d4d1f9e7e77e64ffa708e058094531",
"lowest_price": 200000,
"discount_rate": 0,
"lat": 37.7275181,
"lng": 127.2911518
},
{
"pk": 119,
"name": "남양주 펜션121",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27975/480x0/83ba975a19dcc5569a654177a0913ecd.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bb1aa133d25a262fb2760fdf296a048ab22a288ae058259f7a189b1ba89b7a4e",
"lowest_price": 280000,
"discount_rate": 0,
"lat": 37.6011148,
"lng": 127.330987
},
{
"pk": 118,
"name": "남양주 굿모닝펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22254/480x0/f88a95b74392ebc4804cd6bb445aba42.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=971f7d0f637c9ebb928decb050198aff5ac334f155dc07532acb5fac8e38ac76",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.7260705,
"lng": 127.297533
},
{
"pk": 117,
"name": "남양주 안다미로펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22086/480x0/187f358a6e2d034a63a5a098bd4b0fce.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=183e9abf09da592ebd44d3530052acaf08247d58c333715237fa61c7678da054",
"lowest_price": 99000,
"discount_rate": 0,
"lat": 37.7131742,
"lng": 127.3079352
},
{
"pk": 116,
"name": "남양주 뜨란채펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28247/480x0/f0b60f8810a60161dd15a08d3685f9bf.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=818eb58b16af0b97a35e975b9b60a310800ecb04cfbe5a92af183e69f172ee52",
"lowest_price": 180000,
"discount_rate": 0,
"lat": 37.7218954,
"lng": 127.2720465
},
{
"pk": 115,
"name": "남양주 한울채펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22485/480x0/cc6c53b4131545a299fb02b55a318287.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3c4059facb78b490e69e67ffffc63d2316fb657b681fad05559bcaeb58db92b5",
"lowest_price": 210000,
"discount_rate": 0,
"lat": 37.6968158,
"lng": 127.3415946
},
{
"pk": 114,
"name": "남양주 시즌파이브펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21113/480x0/3d4a36f285b9f77dd8b7188bb0d9d4a4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b8fed3c1b8356f72181346bcadbaf1a41ab086988ddbb6f3672b65e08f6ed335",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.6842391,
"lng": 127.242658
},
{
"pk": 113,
"name": "남양주 맑은물펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26130/480x0/a3a3725ffaa0e2b92efaff76856f6ec7.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6bccbc563be1fce47bc2eed31d378ea2048e7cccbf3f129a77c06eb1ed0da377",
"lowest_price": 200000,
"discount_rate": 0,
"lat": 37.7368546,
"lng": 127.3055456
},
{
"pk": 112,
"name": "남양주 아라크노피아펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22250/480x0/ecff263e06ab63338967c88aceadc4a8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=644f2735ee1c8b2fbe8601799b99c631add7352e26020736ee330d165a2c368e",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.567254,
"lng": 127.2824933
},
{
"pk": 111,
"name": "남양주 나르샤연수원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22934/480x0/af7affef993bcb92f67c6044660276e7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=380a255aa0ee6dddb35f534380d35f2b9b0db6290ba7c347493574114faedd7f",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.740869,
"lng": 127.3055954
},
{
"pk": 110,
"name": "남양주 더버드펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21522/480x0/38ce5f2f52befc5aaf94c9e745a060f8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a4cc2335dd496308c867579d7c87403182ed369afc32856879b2b2fa9120d96a",
"lowest_price": 230000,
"discount_rate": 0,
"lat": 37.7239283,
"lng": 127.3110602
},
{
"pk": 109,
"name": "남양주 코지힐펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20470/480x0/51c7e94ef3b90932794a16333b648b2f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=fb522c9e47564da71f539fad8e0007e9f9acc233eaf47953719371dc2380f300",
"lowest_price": 280000,
"discount_rate": 0,
"lat": 37.7433205,
"lng": 127.2910318
},
{
"pk": 108,
"name": "남양주 송라예술숲펜션[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28409/480x0/3df78c9bc1cf917b3d53e437892b2703.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c24a882ba729e9dfb5b54758e21c5f8ce83b452528d867b8f6c39be6c43a5b47",
"lowest_price": 69000,
"discount_rate": 14,
"lat": 37.6580265,
"lng": 127.3141539
},
{
"pk": 107,
"name": "남양주 에스나인펜션(본부동)[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27987/480x0/f58b3e8dd25e2ca52ae7841a1395ed59.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=22bdd5d114ab0707d614283eb56f1400948a5a5418c94b0271c76e516f38226b",
"lowest_price": 229000,
"discount_rate": 12,
"lat": 37.7570343,
"lng": 127.3088081
},
{
"pk": 106,
"name": "남양주 에스나인펜션(파랑동)[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27985/480x0/567aac766925e694dec22434e40b839e.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8707fc01cafce124ec3d414cc56cdd1408b3651652cd3af307eb974c29c0142d",
"lowest_price": 72000,
"discount_rate": 28,
"lat": 37.7570343,
"lng": 127.3088081
},
{
"pk": 105,
"name": "남양주 에스나인펜션(노랑동)[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24670/480x0/742790beea43fa50b6a5f2a04c776d5c.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5093ac402f81ae4970327010338c85327c36a1f6239e396c8d4ccbfff8c93fca",
"lowest_price": 69000,
"discount_rate": 31,
"lat": 37.7570343,
"lng": 127.3088081
},
{
"pk": 104,
"name": "남양주 포시즌풀빌라펜션[18.6월신축,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28369/480x0/310e476e5e9a5d47eb7afc5144ef9f5c.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=189e2d53e255376add72ab41f7f52c63c624218902e01678229db23d0ed61b6b",
"lowest_price": 459000,
"discount_rate": 8,
"lat": 37.7041612,
"lng": 127.303654
},
{
"pk": 103,
"name": "남양주 에스나인펜션(연두동)[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27983/480x0/f53886247a537397eacda0376c083e89.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=20a677cfa46475afbf43b2b3d96fef27366ff24768d672309eba23cbd43c4089",
"lowest_price": 72000,
"discount_rate": 28,
"lat": 37.7570343,
"lng": 127.3088081
},
{
"pk": 102,
"name": "남양주 에스나인펜션(황토동)[MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27986/480x0/2b86c36e2e9052e2376293c07eb17f23.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=27c97aadac80e8b29eb493b6574cf2f4561dd824e0e15989d6413edea60319d8",
"lowest_price": 229000,
"discount_rate": 12,
"lat": 37.7570343,
"lng": 127.3088081
},
{
"pk": 101,
"name": "남양주 산수정원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21871/480x0/ddc98f91bf1dff652e2985bdd872f5b9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8c306a51f9ffa72520d2d82be718e9b80466242000c8c554c4b10fc6aac676c7",
"lowest_price": 69000,
"discount_rate": 0,
"lat": 37.7278933,
"lng": 127.2880774
}
]
},
{
"name": "파주/양주/김포",
"sub_location_no": "1.001015",
"pensions": [
{
"pk": 140,
"name": "파주 산들바람펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21382/480x0/8230af309d0d04b566160ec61b71b35f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9c3fd2e563e962cae6f5052624936a109f1ddcfe2e9ea484cc3c41af7817da19",
"lowest_price": 230000,
"discount_rate": 0,
"lat": 37.9053946,
"lng": 126.8258955
},
{
"pk": 139,
"name": "양주 솔내음한옥펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25419/480x0/95215fd2a26c2bf4dabe3b48d1808134.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3c94677e5ce05d9f02680c6472c8f7fb8b01ad272e78e9874de19b4b211105b0",
"lowest_price": 165000,
"discount_rate": 0,
"lat": 37.7003485,
"lng": 126.9376326
},
{
"pk": 138,
"name": "파주 W&J펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20747/480x0/7ccc337638eb3f0402b8781445531d92.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4fbd58e81472514c65cae00ab764817c877d16a749e6fa164bf68795d5508328",
"lowest_price": 160000,
"discount_rate": 0,
"lat": 37.8872684,
"lng": 126.8209938
},
{
"pk": 137,
"name": "파주 글램핑클럽레스피아",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26329/480x0/0dffec3b0ce999a0075ae72a82b7b67f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0c79838670dd584bf8abd5ae31611c3b18f7cd6e252b1c531d756ea2792a3877",
"lowest_price": 54000,
"discount_rate": 22,
"lat": 37.7911545,
"lng": 126.8005798
},
{
"pk": 136,
"name": "양주 선녀와나무꾼펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22195/480x0/e5f55d974e9869f3294b8ffb730d4791.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=7e96c07dc788cf6c4a0ae7a1085a6fd4f915497656a6d968dc94542649799763",
"lowest_price": 129000,
"discount_rate": 4,
"lat": 37.8266575,
"lng": 127.0464988
},
{
"pk": 135,
"name": "파주 베조아니펜션(헤이리마을)",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22936/480x0/57fe54470609c1e9b07ddb8c85bcf795.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2cdba600f1cf0f7e15ec04823e49a4521fa7a29b3ef06fc71351aaa948717cb7",
"lowest_price": 115000,
"discount_rate": 0,
"lat": 37.7919998,
"lng": 126.6953068
},
{
"pk": 134,
"name": "양주 장흥해일농장펜션[단독특가]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22257/480x0/ff974170543ca9cf07f86d9cb570335f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d75d86b2c17f402ed23c13c17ca22beb406a0b68d5f60659b6eadc3555d9cc84",
"lowest_price": 99000,
"discount_rate": 17,
"lat": 37.7116513,
"lng": 126.9382935
},
{
"pk": 133,
"name": "양주 장흥힐링펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28375/480x0/a2106adc1710c13518353cbc8eb74a28.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a9acf122a6dbefbcd2e860f1f06f7af28699de33f8131e9bf3b02ea4ed0f2075",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.7531712,
"lng": 126.9445625
},
{
"pk": 132,
"name": "파주 하루정원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19802/480x0/c17880502ec861c088b086bc20e0f621.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f4fb725fc5e353b73f1e261ed01479a807ae14cc20acbb034611722be80c4577",
"lowest_price": 90000,
"discount_rate": 0,
"lat": 37.866634,
"lng": 126.8618951
},
{
"pk": 131,
"name": "파주 마린펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25976/480x0/f3d9ceb1ed805d7fd4124bc4a12d9005.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d5a2294d4ed71dca79906e1a00da723ad4d9b85cd528509b6161f5b5fe272c27",
"lowest_price": 140000,
"discount_rate": 0,
"lat": 37.8951345,
"lng": 126.9246407
},
{
"pk": 130,
"name": "파주 산들펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27066/480x0/888d4d56ca73ea477fa37d17c21bac27.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=7c98a07114027fb976823275bb0836793cdcfa8b1d5bfff2188a06466bd47f0b",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.8945379,
"lng": 126.9247153
},
{
"pk": 129,
"name": "양주 아리스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26625/480x0/882541acdf2bf34c48a6f5b6acb6c34d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5bd365f576c6aa1cf10408bb2805cefbefe04ab2a26a44c8991af31a3cd3dbe5",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.7471501,
"lng": 126.9451019
},
{
"pk": 128,
"name": "파주 펜션힐",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24839/480x0/2ec90ac149c8bbf55516975f7ea1268f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=89d18e7db26789dc5249a3cf19c0e8716c902a950ebd11c8a4092d05b66963cf",
"lowest_price": 180000,
"discount_rate": 0,
"lat": 37.9619667,
"lng": 126.9232901
},
{
"pk": 127,
"name": "파주 달빛가득펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27047/480x0/93409da9aab5bec3a6c348251f9c44a9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d508b53c38f78e0e3557ab7c9d3c4271414e3c77cc969cda148df05a511cba10",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.894093,
"lng": 126.9263226
},
{
"pk": 126,
"name": "파주 바우가든펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22948/480x0/b4b2593ffd203e3d52e42542928c740d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f70ced92750392402e8ff323f846b64775e7def2d0713fa0d0acb2e2878fec54",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.9306776,
"lng": 126.8673894
},
{
"pk": 125,
"name": "양주 여울목펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27925/480x0/46466846d962b80ba4da65ac9978e818.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0f1f9fecf3639385ecf66b25c6905bc7960be489dc78286973edb065a2620298",
"lowest_price": 60000,
"discount_rate": 0,
"lat": 37.7416062,
"lng": 126.9532964
},
{
"pk": 124,
"name": "파주 모이리344펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/33028/480x0/6e20384841cfe1f10f4938748674b063.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d035c35ae89838a5f95cf7d3073558a09dc43d69612fb23140605c0d622e0e65",
"lowest_price": 140000,
"discount_rate": 0,
"lat": 37.8167618,
"lng": 126.691197
},
{
"pk": 123,
"name": "양주 핀란드하우스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25952/480x0/bd0763a8c17b576ad929832cab8e721d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=579982cb33dbe0825ed0269c10b14d495235d50e19d117bf9507e41ed0366768",
"lowest_price": 90000,
"discount_rate": 10,
"lat": 37.9152766,
"lng": 126.9563321
},
{
"pk": 122,
"name": "파주 쇠꼴마을고고펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22953/480x0/b6c4d03df9541968320214dd3c3cb519.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b2c70925cfdd85ab98313a3db285d14fb4b2b3d5f3e0a2594124377949ea7dde",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.8854412,
"lng": 126.8793774
},
{
"pk": 121,
"name": "파주 프로방스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24214/480x0/61639da5f975b0dbad45097bd642bbb6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a645322137aa1da420808b9cd8190ad07daf9f14122ab39ad7146c140216c5ab",
"lowest_price": 350000,
"discount_rate": 0,
"lat": 37.8166317,
"lng": 126.6928768
}
]
},
{
"name": "연천/동두천",
"sub_location_no": "1.001025",
"pensions": [
{
"pk": 149,
"name": "연천 힐링카라반",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28024/480x0/9d66afad07bb3599a137bea00706baa8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d5972a644ad808917a8df77a102f3db158201ef270c503a55a01550e8e6b54f8",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.9969481,
"lng": 126.886331
},
{
"pk": 148,
"name": "연천 석장리미술관카라반&글램핑",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21844/480x0/2f1d138474b9f306e5f3e423f1c696f3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=ed11c8e61b59ba1aeaf7a6ece4edebaff17a5b936f813a773149afd463eab875",
"lowest_price": 58000,
"discount_rate": 17,
"lat": 38.0538971,
"lng": 126.9178348
},
{
"pk": 147,
"name": "연천 조선왕가펜션&글램핑",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26214/480x0/d6dd780523aab8443afa353b76f10a01.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f999e88614488df8d4089bee8975856360452ea439bfd57de168eced8a722bbb",
"lowest_price": 187800,
"discount_rate": 11,
"lat": 38.0635023,
"lng": 127.1014377
},
{
"pk": 146,
"name": "연천 크리스탈빌리지펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31566/480x0/d89e9f22102690b8d1baa741606b7ab0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4e7c7b59d0dae12c6ef36021eb302774c24e828576aaf94aa510a89fbed22484",
"lowest_price": 185000,
"discount_rate": 0,
"lat": 38.0190267,
"lng": 126.9615442
},
{
"pk": 145,
"name": "연천 비경펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25901/480x0/31c569e0771adee9ea84289150532ce8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6c94c7486873e111c9ca0fde7bfc65a73aaf688f847e70aa5f1d63a9f46361a9",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 38.0257511,
"lng": 126.9801229
},
{
"pk": 144,
"name": "연천 솔내음숲속작은집펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28157/480x0/62cfe8967a063cf3a8328bab3d8b9f6b.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1c44c37096c1bd12fa463e38f531fc385d849a30b2b3579cdbdc0532a3df669d",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 38.0488182,
"lng": 127.1116218
},
{
"pk": 143,
"name": "연천 야생초마을아미골펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27722/480x0/d899a63dc01e4bfe2ee1d3950010ae76.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=776d81b090ae3687458e0060eec9f13adc4988ccc885b88e4cd833fa10972848",
"lowest_price": 99000,
"discount_rate": 0,
"lat": 38.0186535,
"lng": 126.9551183
},
{
"pk": 142,
"name": "연천 왕의자택펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25382/480x0/aa73962ae53f7f91711a90843a3c0d4f.PNG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=84b529e21fbfdd4e8c9f0c71fb7784653fd4cef5620202d39c08d49d170e34cb",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 38.0080889,
"lng": 127.0670875
},
{
"pk": 141,
"name": "연천 스텔라토풀빌라&스파[17.7월신축,MD추천]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25601/480x0/017bdc101a63117dd4660696482e5c08.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b6c903e1473dd8cd4b472e22a7a6cea1ed0902c9d4ea2f3dd8cceceedd6e7dd9",
"lowest_price": 359000,
"discount_rate": 8,
"lat": 38.0109236,
"lng": 127.0683748
}
]
},
{
"name": "용인/안성/평택",
"sub_location_no": "1.001020",
"pensions": [
{
"pk": 169,
"name": "용인 깊은산속펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24891/480x0/0837016fd78f8029f67d6986cd0ed393.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c0519dd9ae7122e5a63155c383854a4e6a50c837ce0afab35fe9751fe8c4b8d5",
"lowest_price": 160000,
"discount_rate": 0,
"lat": 37.1342615,
"lng": 127.3294029
},
{
"pk": 168,
"name": "용인 진펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19816/480x0/a7d76b6755e8ad1f69d8ac2dee0e8ea1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a9d2e9a8efc60c75678255e6571a9e84515fc0810c2041cdd0e00cc0b2355b97",
"lowest_price": 250000,
"discount_rate": 0,
"lat": 37.1573754,
"lng": 127.2111754
},
{
"pk": 167,
"name": "용인 바람의언덕펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25030/480x0/17932f8e734221173285cce1e442800f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=28e288ba94b3ebf3729ccaf2ba167929d08c396bcc3ffc977f6426c161894596",
"lowest_price": 220000,
"discount_rate": 0,
"lat": 37.3146746,
"lng": 127.2457822
},
{
"pk": 166,
"name": "용인 세모난나무 펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31969/480x0/b6fe41fc80be7f19a11840de4d8f257b.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=45bc5afe28274465a83e641276c20b835e4a8b2af8692cb0797bb38c0bce744c",
"lowest_price": 240000,
"discount_rate": 0,
"lat": 37.2775078,
"lng": 127.2132016
},
{
"pk": 165,
"name": "안성 진성펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23305/480x0/3a27bcfd883783d2a77bc22f01c8e2b9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6f020bd99cf6c4f4273dcdf97c89aa2da4eecfb8234c8401efcf678bcbd5d3ec",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.1128485,
"lng": 127.2629796
},
{
"pk": 164,
"name": "용인 EBS캠스토리펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/32963/480x0/079f0f9e8cc0f362126903712e30c72f.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=95fdb18618496387e4a3d6fe8804259340aeb809cdedaf661af87dabfa6958a5",
"lowest_price": 159000,
"discount_rate": 0,
"lat": 37.2196458,
"lng": 127.1343144
},
{
"pk": 163,
"name": "수원 로또게스트하우스",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28091/480x0/cb6407effa52a267485bebcb1e608211.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=986668528b8cac09706420ea30d8a1089488899c70831c93232fb4df85a21a86",
"lowest_price": 25000,
"discount_rate": 0,
"lat": 37.293839,
"lng": 127.053028
},
{
"pk": 162,
"name": "용인 둥지별장펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19845/480x0/74823cbf821bb0ba93fe64d491caee42.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=51d05ebbbfc3b033d12b2dbbaacf5b23753f94b90b788a272632ad12a6875220",
"lowest_price": 270000,
"discount_rate": 16,
"lat": 37.1386245,
"lng": 127.3231817
},
{
"pk": 161,
"name": "용인 에버랜드지오펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27828/480x0/d177176bd68bd1a713763076c8292abc.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6f39af70d1c831240a3ca6c733dc53000865c262ec1998cba136b533eb597fbe",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.2705448,
"lng": 127.1982588
},
{
"pk": 160,
"name": "용인 파인하우스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27368/480x0/659bdab6f840d317a950ffb672c3d154.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2d516940e1e84d0d928ac097a9150f2a151b7a77a7a3367d83c1e1666c5a345e",
"lowest_price": 110000,
"discount_rate": 0,
"lat": 37.2705448,
"lng": 127.1982588
},
{
"pk": 159,
"name": "안성 송지원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26138/480x0/1ecb11cb24639ee10d0647715294d657.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6ba25bea74b77d85a7c098fd32c66b081b06924c0ee231a28f3b42ad5aabbcf5",
"lowest_price": 280000,
"discount_rate": 0,
"lat": 37.049087,
"lng": 127.4430187
},
{
"pk": 158,
"name": "용인 에버홈펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25402/480x0/847e8ee18cfd5ebaac8422248720e4d1.PNG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f9f68665e5a156b6b0fbaaae0d407ee3d1c2c68630be68d54d98da6231788e2a",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.2594986,
"lng": 127.1889095
},
{
"pk": 157,
"name": "용인 에이스카라반펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26265/480x0/6e8bac33b3dc2eb0fe31ebefb9dff8de.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d922480ec9afc42785477ec8e940cd13c9041f311d71a787acef18ba5a688509",
"lowest_price": 45000,
"discount_rate": 0,
"lat": 37.1650762,
"lng": 127.2426458
},
{
"pk": 156,
"name": "용인 트레디치펜션[17년신축]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25744/480x0/ed9e1dd9ad18b98b02c14529ddb6d9d3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5ffae90b1bb690c1eba5af736dcfac2698ca1ec7f5f760a6f84263a4cd4325b8",
"lowest_price": 350000,
"discount_rate": 0,
"lat": 37.1546784,
"lng": 127.2802805
},
{
"pk": 155,
"name": "안성 프로방스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26724/480x0/a4d07b2c3959d4247c8da15e8b1156d0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c6ba9c6442393fe812e5477802981e960d708062f65544cfd9dc2bab0b1c6bd6",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.0546078,
"lng": 127.4514244
},
{
"pk": 154,
"name": "안성 고삼마을펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19901/480x0/347ebd02cac4a9c34a364ba922f14fc9.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=121aaed9b3d7a145b3d7b03d8f2efee2bec451bdbe9c7748b1969347d0386727",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.0801587,
"lng": 127.2691457
},
{
"pk": 153,
"name": "안성 레이크펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31469/480x0/1fc8e3d9a501e801620946e6686f95ad.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=6c2ed3219e08bcbc11c13dcb8d7e2b9f7ea17b7c3f0a09d9e947215f25dc2ab5",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.0546643,
"lng": 127.4494137
},
{
"pk": 152,
"name": "용인 엘펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27667/480x0/44878b42d12b942f465d47319a4f9720.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=3814af8bcfc2b7d74e56398d974b42a89062476e111d1c74644f22f28f1e97e2",
"lowest_price": 170000,
"discount_rate": 0,
"lat": 37.2178626,
"lng": 127.3144644
},
{
"pk": 151,
"name": "안성 펜션뜰안채",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26075/480x0/0184a3bb6ee9365302ee8287ebff8056.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0e5777330a66cfd9516f52ca36c0257f088d84a580994804bdb415456fa345ca",
"lowest_price": 160000,
"discount_rate": 0,
"lat": 37.0580708,
"lng": 127.4417466
},
{
"pk": 150,
"name": "용인 별바라기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21282/480x0/f47e4cac30814a36c477bf89484f2b18.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0a11c2c5ff1a92cec239eefcfe2061889ff5a761962c11019fcf367c9a4a7e04",
"lowest_price": 230000,
"discount_rate": 0,
"lat": 37.157233,
"lng": 127.2121215
}
]
},
{
"name": "여주/광주/이천",
"sub_location_no": "1.001019",
"pensions": [
{
"pk": 187,
"name": "광주 종여울펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19874/480x0/6160978672adf9febca5fbc7cc8298c2.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=9e54cddf0152eccfb4d9f7a0ec7f881698cbb2041f1e488ed4f666783108939f",
"lowest_price": 200000,
"discount_rate": 0,
"lat": 37.5243054,
"lng": 127.3598416
},
{
"pk": 186,
"name": "여주 하늘정원펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26221/480x0/c474be88691db4e0bb150522a0301044.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b418e2fe05fcb9ae2697aeb77e39671bcf1982fccfce267c7ac00ceaa0e2744d",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.3701029,
"lng": 127.5042536
},
{
"pk": 185,
"name": "여주 푸른하늘은하수펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27118/480x0/28aeaa4f659ef2004807ec93ae79978e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c602d995e2835fbe059d0667ec1491a195529322d41b99cd21b8ea2ca4ac262d",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.3838289,
"lng": 127.4950311
},
{
"pk": 184,
"name": "여주 그린펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19913/480x0/8cfa97d7f0ffdf2eb79f615254da0787.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b3c17bb978fe51b3bfa94352438ecd81bac8c4309dec78ba4c59d3fad887b260",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.3840401,
"lng": 127.5116318
},
{
"pk": 183,
"name": "여주 굳모닝 펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31987/480x0/f6515e8778067d593bbf4ccba709496c.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0fe54190166c97b6dcb9e098255847193e4630eb0ab1e83ea4439a72ca56c3fe",
"lowest_price": 200000,
"discount_rate": 0,
"lat": 37.4053351,
"lng": 127.4739144
},
{
"pk": 182,
"name": "여주 매실향기펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19930/480x0/33f7874b2ce97c129ebaeeded7e2a2c5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1eceb10790185ad6395bba52ce384486933c556504020814542e8be979a6078c",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.3865795,
"lng": 127.5083901
},
{
"pk": 181,
"name": "여주 숲속펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19933/480x0/152f29d1a9a85fdafb0ff92e9148353f.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8c4432b69ad21cb8ae9d5be74a3de9b39f0f429dd872e846135f3b11cb270f41",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.3700098,
"lng": 127.5033397
},
{
"pk": 180,
"name": "광주 브라운빌펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/20985/480x0/d111d3c20fc6e75eee25d917ad35aff1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=495547bd3e1dc0db0c6f90c5cc5d3da7147e6e3ced31db2bccc53151b8a83085",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.3373654,
"lng": 127.2993466
},
{
"pk": 179,
"name": "여주 해여림빌리지펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22223/480x0/092b873cfced2ee74b8170604db83fc8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=188808aa774cdbb4da19ae1934dfa7d9023efbdb597fe4eff485019906033302",
"lowest_price": 340000,
"discount_rate": 0,
"lat": 37.3919203,
"lng": 127.4378225
},
{
"pk": 178,
"name": "광주 남한산성의집펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21283/480x0/4ad342658217ce0b1406c23106ed50b8.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f3c8c2e58eac47a84fd7c30e0bd8fc1f13e1cc8c33c5af5d29d72e0628d83673",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.449027,
"lng": 127.2260392
},
{
"pk": 177,
"name": "여주 숲속풍경펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24373/480x0/410d1236b80f5ffc9f00adce9457b1ba.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f6edc94893efd1435a798621364dd5629a8e25e2433d2593fcffac01fc0ce3b3",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.3840316,
"lng": 127.511319
},
{
"pk": 176,
"name": "여주 미드미펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27782/480x0/c783e4adbc4e79ebf5ea1f84116ba6e0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c9dcce118433920bdbb16b60fd431fe6b77aa5c893bcf322844eb7e077dc4fb1",
"lowest_price": 150000,
"discount_rate": 0,
"lat": 37.3826439,
"lng": 127.4952051
},
{
"pk": 175,
"name": "여주 두견새머문자리펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21427/480x0/fbe98a8aba1fbf0e58dcc7df981aa828.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=eccc41f58b5ceb61ba48ac0363a674a57608261fe72392d3c5fb090430945bc7",
"lowest_price": 250000,
"discount_rate": 0,
"lat": 37.4197445,
"lng": 127.5216606
},
{
"pk": 174,
"name": "여주 하나펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19921/480x0/48f87de7a789f767b7cb4026d6558748.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d49951a33e3304d324429e1217ea2ce93ed68daaf00e23142aaa38980d44b886",
"lowest_price": 110000,
"discount_rate": 0,
"lat": 37.4160265,
"lng": 127.4563877
},
{
"pk": 173,
"name": "여주 예터&웨딩펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27836/480x0/21b6bcc47864123a687e056877d9f46e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1f22cd3772d3f7372d25a890235c4d2f15f5b0ea972cb7bb732ef976b99bd4b9",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.1649135,
"lng": 127.6917023
},
{
"pk": 172,
"name": "여주 약수터펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19907/480x0/c634e12d2c8391c4feb37aec93811159.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b417c4572ec03e2cb962affda283ecb39d9d06c70de636e23e0a8fb2c6999b59",
"lowest_price": 250000,
"discount_rate": 0,
"lat": 37.3804018,
"lng": 127.4895098
},
{
"pk": 171,
"name": "여주 화이트하우스펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/19934/480x0/03e191d9c38e981a45d3eccd55b8f25f.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0b1e6a582d3eb9798c5102138105774d6953ba3eef0e7d64af8a172d56f6bd35",
"lowest_price": 300000,
"discount_rate": 0,
"lat": 37.2082043,
"lng": 127.577184
},
{
"pk": 170,
"name": "여주 하몽별장펜션[17년신축]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27291/480x0/ba2da9718166055711da64c45766eac8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f780d984289da309bd5d8d88b49e1c53b18b4728ee04e5d856a0e010ceabcffd",
"lowest_price": 380000,
"discount_rate": 0,
"lat": 37.4016889,
"lng": 127.442999
}
]
},
{
"name": "화성(제부도)",
"sub_location_no": "1.001017",
"pensions": [
{
"pk": 207,
"name": "화성(제부도) 펜션아이리스",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27431/480x0/9d709d50adf183c6c8ec74132fd416b0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=23b406e632afb847a74587c257e045f30b3d81987cd27deecbc311efd4b60317",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 206,
"name": "화성(제부도) 갯벌민박펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25897/480x0/bc2822644e9fa96fa3dea922630bc503.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=42c363f27fd19e40fdc8604da1e0e6772237f8d544491097cf301b440f9b61c2",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 205,
"name": "화성(어섬) 노을따라펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24717/480x0/30203534063a2710ab5d080568dd11df.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=84c2610e4d5c4bd59c2eef0b3da64050fb4d7a754b22f82d5a92d52e1f1fcbb0",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.2480699,
"lng": 126.6508516
},
{
"pk": 204,
"name": "화성(제부도) 동미산펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27894/480x0/efb80f5aed07972de3607fc881a726ea.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c222bb8bd040d450618255e43933336ddef98e789e0cbc1124738634f5a5d724",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.1643276,
"lng": 126.6200434
},
{
"pk": 203,
"name": "화성(제부도) 제부비치타운펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26476/480x0/b526d8bde90a59806a72df671ddadc81.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=99428d4ee1fc435f580169d22acf32b08edf6185d7bda20956cec793d51c2a11",
"lowest_price": 45000,
"discount_rate": 0,
"lat": 37.1666723,
"lng": 126.6258479
},
{
"pk": 202,
"name": "화성(제부도) 미고펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25975/480x0/6f47c7f28a1226e62fc63ce3b0f973b1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f529608f928d3a207131496b1c2a67dc3f457c197da22ad85d7f88ebe4477aef",
"lowest_price": 85000,
"discount_rate": 0,
"lat": 37.165883,
"lng": 126.6197656
},
{
"pk": 201,
"name": "화성(제부도) 그린펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22434/480x0/73d22926fa35ba5e1939edb7eb2fb307.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=492407f9eb32fc83500e0652eca44d46a8fd6747629f3bf23fd6f6bc7859066f",
"lowest_price": 50000,
"discount_rate": 0,
"lat": 37.1669446,
"lng": 126.617566
},
{
"pk": 200,
"name": "화성(제부도) 산토리니펜션7동(이아동)",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/25854/480x0/380c7cee77d6c5e178f58dfccb39e3a3.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=4b845d1b86f912b1486a828d96fab1cfa246657906fd1e307d7d91cc0df0b21f",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.1584932,
"lng": 126.6574055
},
{
"pk": 199,
"name": "화성(어섬) 여울터펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26123/480x0/da744e0d0193e5956377d4b6ad7dee1a.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=fe2036865c3b33c2c05bcf1a40e2aadcadddb4b4608160596edd6a2d0d5988cd",
"lowest_price": 130000,
"discount_rate": 0,
"lat": 37.2480248,
"lng": 126.6506168
},
{
"pk": 198,
"name": "화성(제부도) 소올펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22468/480x0/a7d5b6afb58bded585ea4cf6967295b4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=1aabbd151288d3672e7ef95787000c1187b9f4c8e07f98f1dd6b595bb07c5733",
"lowest_price": 120000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 197,
"name": "화성(제부도) 스테이바이더씨펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/28237/480x0/ac8b65a3666a35271087743b2c6d9643.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=30858563a276b17327e2d6502f9c84cf8215ff57d2ef6e90d7c916e8f719e4f1",
"lowest_price": 189000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 196,
"name": "화성(제부도) 해뜨는집펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/26834/480x0/c5e2d7c4c1e5d8d1d098f296ea144021.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f214ed95b619e22fbf51c7601065a078095af6c0b976f85d4402ceebc7bebee2",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 195,
"name": "화성(어섬) 별빛사랑채펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21371/480x0/9b3f56158fed50cef1590e37b5b156d1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e3a6956085473f17902ce18b8a6a321da2a3aa3f6baf5e26b12c1fabc3eabc17",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.2478321,
"lng": 126.6506259
},
{
"pk": 194,
"name": "화성(제부도) 레인보우펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/24711/480x0/a7e413071422fc8133471beb63770cc0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=2c6ebf36c08681cc2ed3703569fa4fa52607a56673b5460f88efbc00fe8efcfb",
"lowest_price": 85000,
"discount_rate": 0,
"lat": 37.1678828,
"lng": 126.6270148
},
{
"pk": 193,
"name": "화성(제부도) 작은섬펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/23349/480x0/d0d5882fcd893a2c298f405283b24187.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5db922d1beea1cac99ac3389f6b4015356f8f9a7bc02a78e6029096e1fbc3fa7",
"lowest_price": 60000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 192,
"name": "화성(어섬) 아일랜드펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21453/480x0/6589390cdde6d4756efe48c2a3d59667.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=b5fc9117e386e2ca7ae8d062a419f02c73adde2521dfc7ed6a2feb25f14e744d",
"lowest_price": 80000,
"discount_rate": 0,
"lat": 37.2427652,
"lng": 126.652417
},
{
"pk": 191,
"name": "화성(제부도) 산토리니펜션9동(피라동)",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/27110/480x0/bc2ff098c81be4173aaf2bd99de112da.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=c6251d7017e114f4a84593185384fdb9ec62999a1858756df46f0645863debc6",
"lowest_price": 160000,
"discount_rate": 20,
"lat": 37.1583959,
"lng": 126.6570853
},
{
"pk": 190,
"name": "화성(제부도) 다솜펜션",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/21346/480x0/7e27e8e304c6a61afc7c772b8aa84da5.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=95084e787ada15ebbf19e18ee13ce79b427bb5a90a2d7729554c4b99f7204b43",
"lowest_price": 100000,
"discount_rate": 0,
"lat": 37.1710576,
"lng": 126.6224067
},
{
"pk": 189,
"name": "화성(제부도) 산토리니펜션8동(이메로동)",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22461/480x0/1e3fedf33fd7d4e21f831a71a0d9191d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d823144230070c4bd5ae761ead456ab71e37b544de1fb84fec128b2fa0e9fb77",
"lowest_price": 160000,
"discount_rate": 20,
"lat": 37.1584932,
"lng": 126.6574055
},
{
"pk": 188,
"name": "화성(제부도) 모세게스트하우스[단독특가]",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/22024/480x0/0d8c311b45db8d0a43b639c0363e0562.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=0cf8346ffacd1526b0ad5707ec102122a91bec9a7a4e7e57266138956546b549",
"lowest_price": 180000,
"discount_rate": 0,
"lat": 37.1720934,
"lng": 126.6250893
}
]
},
{
"name": "부천",
"sub_location_no": "1.001022",
"pensions": [
{
"pk": 208,
"name": "시흥 작은쉼터캠핑장&카라반",
"pension_image_thumbnail": "https://yapen-production.s3.amazonaws.com/media/http%3A/img.yapen.co.kr/pension/basic/31508/480x0/406a824a53bea2182a1b401be3aecf6b.JPG?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJRKUIYTMFJZD6KNA%2F20180810%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20180810T022907Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=400f81c28b135d8db28f6e57e139fedc0fd2ea51937cda87a2a88701ee84e6ab",
"lowest_price": 50000,
"discount_rate": 0,
"lat": 37.3492446,
"lng": 126.7589714
}
]
}
]
}
]
"""

let pensionJsonData = pensionJson.data(using: .utf8)!
let pensionData2 = try! JSONSerialization.jsonObject(with: pensionJsonData) as! [[String:Any]]









//do {
//    let pensionData = try JSONDecoder().decode([PensionData].self, from: pensionJsonData)
//} catch {
//    print(error.localizedDescription)
//}


