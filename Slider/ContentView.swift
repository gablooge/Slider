//
//  ContentView.swift
//  Slider
//
//  Created by Samsul Hadi on 02/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var CurrentIndex : Int = 1
    
    var body: some View {
        VStack {
            
            //Carausel Slider
            TabView(selection: $CurrentIndex) {
                ForEach(1...3,id: \.self) {index in
                    
                    //Costum Scroll Effect
                    GeometryReader{proxy -> AnyView in
                        let minX = proxy.frame(in: .global).minX
                        let width = UIScreen.main.bounds.width
                        let progress = -minX / (width * 2)
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        return AnyView(
                            VStack{
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal,10)
                                
                                Text("Loren ipsum dlipsum")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                                //.background(Color.green)
                                    .padding()
                                
                                Text("Loren ipsum, or dlipsum as is somtine know text usded layoyt Loren ipsum, or dlipsum as is somtine know text usded layoyt")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            .scaleEffect(scale)
                            
                       )
                    }
                    .tag(index)
                }// End ForEach
            
        }// End tabview
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            //costume tab indicator...
            CostumeTabIndicator(count: 3, current: $CurrentIndex)
                .padding(.vertical)
                .padding(.top)
            VStack(spacing: 15){
                
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "arrow.right.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white,lineWidth: 1)))
                    
                })
            }
            .padding()
            
        }// End VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white).ignoresSafeArea()
        
    }// End body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CostumeTabIndicator: View {
    
    var count : Int
    @Binding var current: Int
    
    var body: some View {
        
        HStack {
            
            HStack {
                ForEach(0..<count,id: \.self) {index in
                    
                    ZStack {
                        //image index start from 1..
                        if (current - 1) == index {
                            Circle()
                                .fill(Color.black)
                        }
                        else {
                            
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1.5))
                        }
                    }
                    .frame(width: 10, height: 10)
                }
         }
      }
   }
}
