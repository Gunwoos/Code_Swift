//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct Reporsitories: Decodable{
    let name: String
//    let sublocations: [Repository]
    
//    enum CodingKeys: String, CodingKey{
//        case sublocations
//    }
//
//    struct Repository: Decodable{
//        let locationName: String
//        let subLocationNumber: String
//
//        enum CodingKeys: String, CodingKey {
//            case locationName = "name"
//            case subLocationNumber = "sub_location_no"
//        }
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            locationName = try values.decode(String.self, forKey: .locationName)
//            subLocationNumber = try values.decode(String.self, forKey: .subLocationNumber)
//
//        }
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        sublocations = try values.decode([Repository].self, forKey: .sublocations)
//    }
    
}


let data = "https://www.pmb.kr/location/"

func getData(){
    let dataURL = URL(string: data)!
    let dataTask = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
        guard let response = response as? HTTPURLResponse, let data = data else { return }
        guard 200..<400 ~= response.statusCode else {
            print("sever error")
            return
            
        }
        do {
            let repositories = try JSONDecoder().decode(Reporsitories.self, from: data)
            print(repositories.name)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    dataTask.resume()
}

getData()
//: [Next](@next)
