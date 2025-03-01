//
//  Home.swift
//  Single Note
//
//  Created by Jason Qiu on 3/1/25.
//

import SwiftUI
import Combine

struct Home: View {
    @EnvironmentObject var noteData: NoteData
    @State private var userInput: String = ""
    var body: some View {
        VStack(spacing: 10) {
            TextField("Enter your note here", text: $noteData.userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            //Text("Your note: \(noteData.userInput)")
                //.padding(.horizontal)
        }
        .padding()
        .frame(width: 300, height: 100)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
