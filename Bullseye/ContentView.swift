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
			Spacer()
			
			// Target row
			HStack {
				Text("Put the bullseye as close as you can to:")
				Text("100")
			}
			
			Spacer()
			
			// Slider row
			
			HStack {
				Text("1")
				Slider(value: .constant(10))
				Text("100")
			}
			
			Spacer()
			
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
			
			Spacer()
			
			// Score row
			
			HStack {
				Button(action: {
					
				}) {
					Text("Start over")
				}
				Spacer()
				Text("Score:")
				Text("999999")
				Spacer()
				Text("Round:")
				Text("999")
				Spacer()
				Button(action: {
					
				}) {
					Text("Info")
				}
			}
			.padding(.bottom, 20)

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
