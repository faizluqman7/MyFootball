//
//  homepages.swift
//  MyFootball
//
//  Created by Faiz Luqman on 19/12/2020.
//

import SwiftUI
struct introview: View{
    var body: some View{
        VStack{
            
            CardView(title: "Welcome!", subtitle: "Thank you for downloading this app", text: "This app is designed to promote the beautiful game of football")
                .padding()
            CardView(title: "Football", subtitle: "The most popular sport in the world", text: "Please do rate our app")
                .padding()
            CardView(title: "Aims of this App", subtitle: "To enhance and encourage the sport of football", text: "Please do rate our app")
                .padding()
            CardView(title: "Developer", subtitle: "independent Developer", text: "From KL, Malaysia")
                .padding()
            
            Spacer()
        }
        }
    }


struct historyview: View{
    var body: some View{
        Text("")
    }
}

struct whyview: View{
    var body: some View{
        Text("")
    }
}

struct topview: View{
    var body: some View{
        Text("")
    }
}

struct CardView: View {
    var title: String
    var subtitle: String
    var text: String
    var body: some View {
    
        GeometryReader { geometry in

            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .font(.title)
                            .bold()
                        Text(subtitle)
                            .font(.subheadline)
                            .bold()
                        Text(text)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .lineLimit(.none)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    
                    
                }.padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}
