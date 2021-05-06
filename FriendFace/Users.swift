//
//  Users.swift
//  FriendFace
//
//  Created by Brendan Keane on 2021-05-05.
//

import Foundation

class Users: ObservableObject {
    @Published var users = [User]() /*{
        didSet {
            // create a Json encoder
            let encoder = JSONEncoder()
            // try to encode our class array into JSON style
            if let encoded = try? encoder.encode(users) {
                //store our data into the user defaults under our chosen key term
                UserDefaults.standard.set(encoded, forKey: "User")
            }
        }
    }
    */
    init() {
        self.users = []
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                self.users = decodedUsers
                print("Data Received")
                return
            } else {
                print("Data Failed to Load")
            }
        } .resume()
    }
    
    /*
    //initialises app with initial settings (stored by user)
    init() {
        //check to see if there is any data stored with our key word
        if let users = UserDefaults.standard.data(forKey: "User") {
            //create a JSON decoder
            let decoder = JSONDecoder()
            // try to decode our data into an array of User types
            if let decoded = try? decoder.decode([User].self, from: users) {
                //store resulting data into out class
                self.users = decoded
                return
            }
        }
        self.users = []
    }
*/
    func loadUsers() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                self.users = decodedUsers
                print("Data Received")
                return
            } else {
                print("Data Failed to Load")
            }
        } .resume()
    }
}
