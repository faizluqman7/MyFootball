//
//  ContentView.swift
//  MyFootball
//
//  Created by Faiz Luqman on 18/12/2020.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var search: String = "Football"
    
    private func getNearbyLandmarks() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
            }
        }
    }
    
    var body: some View {
        
        TabView{
            homepage()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            positions()
                .tabItem {
                    Text("Positions")
                    Image(systemName: "person.3")
                }
            NewsView()
                .tabItem {
                    Text("News")
                    Image(systemName: "envelope.open")
                }
                
            VStack{
                Text("Football Academies Near You")
            MapView(landmarks: landmarks)
                .onAppear(perform: {
                    self.getNearbyLandmarks()
                })
                .padding()
                .cornerRadius(10)
            }
                .tabItem {
                    Text("Places")
                    Image(systemName: "map")
                }
            BMICalculatorView()
                .tabItem {
                    Text("BMI")
                    Image(systemName: "gauge")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct homepage: View{
    var body: some View{
        NavigationView{
            ZStack{
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    navigationlinks()
                }
            }.navigationBarTitle("Home")
        }
    }
}

struct positions: View{
    var body: some View{
        NavigationView{
            ZStack{
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            VStack{
            Text("Discover the different playing positions of football here")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white).padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .padding()
                Spacer()
                ZStack{
                    Image("fieldbg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.7)
                        .cornerRadius(20)
                        .padding()
                    fieldpositions()
                }
            }.navigationBarTitle("Positions")
            }
        }
    }
}

struct about: View{
    var body: some View{
        Text("About me")
    }
}

//buttons for homepage
struct navigationlinks: View{
    var body: some View{
        NavigationLink(destination: introview()){
            Text("Introduction")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white).padding(25)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
            
        }
        .padding()
            NavigationLink(destination: historyview()){
                Text("History")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
            NavigationLink(destination: whyview()){
                Text("Why play \nfootball?")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(35)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
            NavigationLink(destination: topview()){
                Text("Best Teams \nand Players")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
    }
}

struct fieldpositions: View{
    var body: some View{
        VStack{
            NavigationLink(destination: forward()){
                Text("Forward")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
            NavigationLink(destination: midfield()){
                Text("Midfield")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
            NavigationLink(destination: defence()){
                Text("Defence")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
            NavigationLink(destination: goalie()){
                Text("Goalkeeper")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white).padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                
            }
            .padding()
        }
    }
}


