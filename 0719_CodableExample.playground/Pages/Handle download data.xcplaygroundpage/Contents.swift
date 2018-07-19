//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
// 비동기 처리 작업을 위함
//: - - -
//: # Handle download data
//: - - -


struct Repositories: Decodable {
  let items: [Repository]

  enum CodingKeys: String, CodingKey {
    case items
  }

  struct Repository: Decodable {
    let fullName: String
    let description: String?
    let starCount: Int
    let forkCount: Int
    let url: String

    enum CodingKeys: String, CodingKey {
      case fullName = "full_name"
      case description = "description"
      case starCount = "stargazers_count"
      case forkCount = "forks_count"
      case url = "html_url"
        // 키 값은 api 에서 보고 같은 이름으로 지정해서 바꿔주어야함
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fullName = try values.decode(String.self, forKey: .fullName)
        description = try values.decode(String?.self, forKey: .description)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
        starCount = try values.decode(Int.self, forKey: .starCount)
        forkCount = try values.decode(Int.self, forKey: .forkCount)
        url = try values.decode(String.self, forKey: .url)
        
    }
  }
    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decode([Repository].self, forKey: .items)
        
    }
}



//extension Coordinate: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//    }
//}
//let additionalInfo = try values.nestedContainer(
//)
//)
//keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo
//elevation = try additionalInfo.decode(
//Double.self, forKey: .elevation


// https://developer.github.com/v3      // github api document
let urlString = "https://api.github.com/search/repositories?q=language:swift+user:giftbott"

func fetchGitHubRepositories() {
  let url  = URL(string: urlString)!

  let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let response = response as? HTTPURLResponse, let data = data else { return }
    guard 200..<400 ~= response.statusCode else { return }
    do {
      let repositories = try JSONDecoder().decode(Repositories.self, from: data)
      for repository in repositories.items {
        print(repository.fullName)
        print(repository.description ?? "")
        print(repository.starCount)
        print("\n= = = = = = = = = = = = = = =\n")
      }
    } catch {
      print(error.localizedDescription)
    }
  }
  dataTask.resume()
}

fetchGitHubRepositories()


/***************************************************
 [ 실습 ]
 1.
 struct Repository 내부에 생략된 decoder 메서드를 추가하고 동일하게 동작하도록 구현
 init(from decoder: Decoder) throws {}
 
 2.
 문서를 보고 원하는 api 를 찾아 적용하는 연습
 swift 언어로 짜여진 Repository 중 star 가 높은 순서부터 출력하는 api url 을 찾아 내용 출력
 ***************************************************/


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
