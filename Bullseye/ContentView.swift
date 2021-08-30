//
//  ContentView.swift
//  Bullseye
//
//  Created by Анастасия on 17.08.2021.
//

import SwiftUI

struct ContentView: View {
	@State var alertIsVisible: Bool = false
	
    var body: some View {
		VStack {
			Text("Welcome to my first app!")
				.fontWeight(.black)
				.foregroundColor(.green)
				.padding()
			Button(action: {
				print("Button pressed!")
				self.alertIsVisible = true
			}) {
				Text("Hit me!")
			}
			.alert(isPresented: self.$alertIsVisible, content: {
				Alert(title: Text("Hello there!"),
					  message: Text("This is my first pop-up!"), dismissButton:
					.default(Text("Awesome!")))
			})
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
