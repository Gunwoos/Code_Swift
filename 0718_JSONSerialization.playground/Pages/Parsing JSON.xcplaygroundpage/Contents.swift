//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
// playground 에서 비동기 작업을 위한 설정

//: - - -
//: # Parsing JSON
//: - - -

// http://open-notify.org/Open-Notify-API/

let astronauts = "http://api.open-notify.org/astros.json"  // 우주비행사 정보
let apiURL = URL(string: astronauts)!

let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
  guard error == nil else { return print(error!) }
  guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
    print("StatusCode is not valid")
    return
  }
  guard let data = data,
    let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any]
    else { return print("No Data") }
  print("jsonObject :", jsonObject)
  
  guard (jsonObject["message"] as? String) == "success",
    let people = jsonObject["people"] as? [[String: String]],
    let peopleCount = jsonObject["number"] as? Int
    else { return print("Parsing Error") }
  
  print("\n---------- [ Parsing Success ] ----------\n")
  print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
  
  print("= 우주비행사 명단 =")
  people
    .compactMap { $0["name"] }
    .forEach { print($0) }
}

// resume() 이라는 메소드를 사용
dataTask.resume()




/***************************************************
 [ 실습 ]
 다음 주소를 통해 얻은 json 데이터를 파싱하여 출력하기
 "http://api.open-notify.org/iss-now.json"   // 국제정거장 위치 정보
 ***************************************************/

let data = "http://api.open-notify.org/iss-now.json"
let dataURL = URL(string: data)!

let dataTask2 = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
    guard error == nil else { print(error!); return }
    guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
        print("StatusCode is not valid")
        return
    }
    guard let data = data,let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any]
        else { return print("No Data") }
    print("jsonObject :", jsonObject)
    
    guard (jsonObject["message"] as? String) == "success",
        let position = jsonObject["iss_position"] as? [String:String],
        let timestamp = jsonObject["timestamp"] as? Int
        else { return print("Parsing Error") }

    print("\n parsing success")
    print("timestamp : \(timestamp)")
    print("latitude : \(position["latitude"]!)")
    print("longitude : \(position["longitude"]!)")
}

//dataTask2.resume()

//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
