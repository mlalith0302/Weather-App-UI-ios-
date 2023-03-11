//
//  ContentView.swift
//
//  Created by Lalith Mulukutla on 11/03/23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    ImageName: isNight ? "moon.fill" : "cloud.sun.fill",
                    Temperature: 76)

                .padding(.bottom, 45)
                HStack(alignment: .center, spacing: 20){
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 78)
              
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.snow.fill",
                                   temperature: 78)
                 
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.dust.fill",
                                   temperature: 78)
                  
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "sun.max.fill",
                                   temperature: 78)
                   
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "snow",
                                   temperature: 78)

                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
            }
           
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            
            Text("\(temperature)°")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    

    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("aqua_blue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
    
}

struct MainWeatherStatusView: View {
    
    var ImageName: String
    var Temperature: Int
    
    var body: some View{
        VStack (alignment: .center, spacing: 10){
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height:150)
            
            Text("\(Temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
