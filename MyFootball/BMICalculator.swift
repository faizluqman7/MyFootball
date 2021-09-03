//
//  BMICalculator.swift
//  MyFootball
//
//  Created by Faiz Luqman on 02/01/2021.
//
import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct BMICalculatorView: View {
    @State private var weight = ""
    @State private var height = ""
    @State private var bmi: Double = 0
    @State private var bmiresult: Double = 0
    @State private var bmimessage = ""
    
    var body: some View {
        VStack{
            Text("BMI Calculator")
            .font(.system(.largeTitle)).padding().multilineTextAlignment(.center).padding().foregroundColor(Color.white).background(LinearGradient(gradient: Gradient(colors: [Color.orange , Color.yellow]),startPoint: .leading , endPoint: .trailing)).cornerRadius(15)
                .padding()
            
            HStack{
                Text("Enter Weight: ")
                    .font(.system(.footnote)).padding()
                TextField("in Kilograms (KG)", text: $weight)
                    .keyboardType(.decimalPad)
                    .padding()
            }.padding()
            
            HStack{
                Text("Enter height: ")
                    .font(.system(.footnote)).padding()
                TextField("in Meters (m)", text: $height).keyboardType(.decimalPad).padding()
            }.padding()
            Button(action: {
                let doubleweight = Double(self.weight) ?? 0
                let doubleheight = Double(self.height) ?? 0
                
                self.bmiresult = self.calculatebmi(h: doubleheight, w: doubleweight)
                
                self.bmimessage = self.returnmessage(x: self.bmiresult)
                self.hideKeyboard()
            }) {
                Text("Calculate!")
                    .font(.system(size: 30)).padding(7).foregroundColor(Color.white).background(Color.red).cornerRadius(20).padding(7).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red , lineWidth: 5)).padding()
            }
            
            Text("Your BMI Value is: \n ")
            Text("\(bmiresult, specifier: "%.2f")")
                .font(.system(.headline)).padding().foregroundColor(Color.white).background(LinearGradient(gradient: Gradient(colors: [Color.purple , Color.blue]),startPoint: .leading , endPoint: .trailing)).cornerRadius(15).padding()
            
            Text(bmimessage)
                .font(.system(size: 25)).padding()
            Spacer()
        }
    }
    
    func calculatebmi(h: Double, w: Double) -> Double {
        bmi = w/(h*h)
        return bmi
    }
    func returnmessage(x: Double) -> String {
        var message: String = ""
        if x >= 40{
            message = "Extremely obese! This is your chance to lose weight by playing more football!"
        }
        else if x < 40 && x >= 30{
            message = "Obese! Go lift a few weights and head to the field"
        }
        else if x < 30 && x >= 25{
            message = "Overweight! Limit your food and get to the pitch!"
        }
        else if x < 25 && x >= 18.5{
            message = "Good weight! Keep it up! Perfect weight for footballers"
        }
        else{
            message = "Underweight! Eat more!"
        }
        
        return message
    }
}
