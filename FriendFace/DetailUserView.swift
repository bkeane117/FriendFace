//
//  detailUserView.swift
//  FriendFace
//
//  Created by Brendan Keane on 2021-05-05.
//

import SwiftUI

struct DetailUserView: View {
    @ObservedObject var people: Users
    let user: User
    var friends: [User] = []
    var body: some View {
        VStack {
            Text(user.name)
                .font(.headline)
            Text("Active: \(user.isActive ? "Active" : "Not Active")")
                .foregroundColor(user.isActive ? .green : .red)
            Text("Age: \(String(user.age))")
            Text("Company: \(user.company)")
            Text("Address: \(user.address)")
            Text("Email: \(user.email)")
            Text("Member Since \(user.registered)")
            Text("Tags: \(user.tagsList)")
            ForEach(self.user.friends) { friend in
                NavigationLink(destination: DetailUserView(people: people, user: people.users.first(where: {friend.id == $0.id})!)) {
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .font(.headline)
                    }
                }
            }
        }
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}
/*

*/
struct detailUserView_Previews: PreviewProvider {
    static let friend: Friend = Friend(id: "my Id", name: "Joey Blowey")
    static let user: User = User(id: "id", isActive: false, name: "Joe Blow", age: 25, company: "Intel", email: "anEmail@gmail.com", address: "123 fake st", about: "Iam a cool guy that likes to be an example in terrible apps", registered: "present", tags: ["BJJ", "programming", "gym"], friends: [friend])
    static let users: Users = Users()
    static var previews: some View {
        DetailUserView(people: users, user: user)
    }
}
