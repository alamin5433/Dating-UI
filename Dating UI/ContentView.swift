//
//  ContentView.swift
//  Dating UI
//
//  Created by Al Amin on 16/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    var body: some View {
        NavigationView{
            ZStack{

                Image("bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)

                NavigationLink(destination: MyProfile(show: $show), isActive: self.$show) {
                    Text("")
                }

                Button(action: {
                    self.show.toggle()
                }) {
                    VStack{
                        Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                        Text("My Profile")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
               // MyProfile()

            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        }
        
       // MyProfile()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomShap: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addArc(center: CGPoint(x: rect.width / 2, y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
       
        return path
    }
}

struct CustomBlue: UIViewRepresentable {
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        
        return blur
    }
}

struct MyProfile: View {
    @Binding var show:Bool
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        Image("menu")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image("close")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                
                Spacer()
                
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 20){
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Bella,")
                                    .font(.title)
                                Text("25")
                            }
                            Spacer()
                            HStack(spacing: 8){
                                Image("map")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 15, height: 20)
                                Text("9 Miles")
                            }
                            .padding(9)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(10)
                        }
                        .padding(.top, 30)
                        Text("Hi! My name is Bella. I live in New Orleans. I love traveling and adventure. I like sharing my thoughts and adore people who except me the way I am. I see the world in different a way and I m always positive.")
                    }
                    .padding()
                    .background(CustomBlue())
                    .clipShape(CustomShap())
                    .cornerRadius(15)
                    ZStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image("play")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(20)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        Circle()
                            .stroke(Color.yellow, lineWidth: 5)
                            .frame(width: 70, height: 70)
                        
                    }
                    .offset(x: 0, y: -35)
                    .padding(.bottom, -35)
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image("heart")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 25, height: 20)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            
                            
                        }
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image("smile")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                            
                            
                        }
                    }
                    .padding(.horizontal)
                    .offset(x: 0, y: -30)
                }
            }
            .padding()
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
