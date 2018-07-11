//: Playground - noun: a place where people can play

import UIKit

class friend{
    var friendList : Array<String?> = [nil,"tom"]

    func addFriend(newFriend : String){
        friendList.append(newFriend)
    }

    func printFriendList(){
        print("Friend List")
        for index in self.friendList.startIndex..<self.friendList.endIndex{
            if let myFriend = self.friendList[index]{
                print(myFriend)
            }
            else{
                print("There is no friend's name")
            }
        }
        print("-end-")
    }
}

var newFriendList = friend()

//newFriendList.addFriend(newFriend: "james")

newFriendList.printFriendList()

//var maybeName : String? = "Tom"
//var isName : String = maybeName! // ! 를 사용하여 옵셔널 값을 unwrapping 해주어야 nonoptional 변수에 넣을 수 있음
//
//if maybeName != nil {
//    print("name is \(maybeName!)")
//}
//else{
//    print("maybeName == nil")
//}
