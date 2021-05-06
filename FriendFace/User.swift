//
//  User.swift
//  FriendFace
//
//  Created by Brendan Keane on 2021-05-05.
//

import Foundation

struct User: Codable, Identifiable {
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
    
    var friendList: String {
        var totalFriends = ""
        for friend in friends {
            totalFriends += " \(friend.name.capitalized))"
        }
        return totalFriends
    }
    
    var tagsList: String {
        var totalTags = ""
        for tag in tags {
            totalTags += " \(tag)"
        }
        return totalTags
    }
    
    /*
    var formattedRegisteredDate: String {
        if let registered = registered {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: registered)
        } else {
            return "N/A"
        }
    }
    */
}
