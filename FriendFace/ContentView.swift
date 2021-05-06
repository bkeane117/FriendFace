//
//  ContentView.swift
//  FriendFace
//
//  Created by Brendan Keane on 2021-05-05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var people = Users()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people.users) { user in
                    NavigationLink(destination: DetailUserView(people: people, user: user)) {
                        VStack(alignment: .leading){
                            Text("\(user.name)")
                                .font(.headline)
                            Text("Friend count: \(user.friends.count)")
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
