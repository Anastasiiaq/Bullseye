//
//  ContentView.swift
//  Bullseye
//
//  Created by Анастасия on 17.08.2021.
//

import SwiftUI

struct ContentView: View {
	
	// Properties
	// ==========
	
	// User interface views
	@State var alertIsVisible: Bool = false
	
	// User interface content and layout
    var body: some View {
		VStack {
			// Target row
			Text("Welcome to my first app!")
				.fontWeight(.black)
				.foregroundColor(.green)
				.padding()
			
			// Slider row
			// TODO: Add views for the slider row here.
			
			// Button row
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
			
			// Score row
			// TODO: Add views for the score, rounds, and start and info buttons here.
		}
    }
	// Methods
	// =======
}

// Preview
// =======
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} #endif
