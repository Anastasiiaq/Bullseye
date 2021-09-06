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
	@State var alertIsVisible = false
	@State var sliderValue = 50.0
	@State var target = Int.random(in: 1...100)
	var sliderValueRounded: Int {
		Int(self.sliderValue.rounded())
	}
	@State var score = 0
	
	// User interface content and layout
    var body: some View {
		VStack {
			Spacer()
			
			// Target row
			HStack {
				Text("Put the bullseye as close as you can to:")
				Text("\(self.target)")
			}
			
			Spacer()
			
			// Slider row
			
			HStack {
				Text("1")
				Slider(value: self.$sliderValue, in: 1...100)
				Text("100")
			}
			
			Spacer()
			
			// Button row
			Button(action: {
				self.alertIsVisible = true
			}) {
				Text("Hit me!")
			}
			.alert(isPresented: self.$alertIsVisible, content: {
				Alert(title: Text("Hello there!"),
					  message: Text(self.scoringMessage()), dismissButton:
						.default(Text("Awesome!")) {
							self.score = self.score + self.pointsForCurrentRound()
							self.target = Int.random(in: 1...100)
						}
				)
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
				Text("\(self.score)")
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
	
	func pointsForCurrentRound() -> Int {
		let maximumScore = 100
		let difference = abs(self.sliderValueRounded - self.target)
		return maximumScore - difference
	}
	
	func scoringMessage() -> String {
		return "The slider's value is \(self.sliderValueRounded)\n" +
				"The target value is \(self.target)\n" +
				"You scored \(self.pointsForCurrentRound()) points this round"
	}
}

// Preview
// =======
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} #endif
