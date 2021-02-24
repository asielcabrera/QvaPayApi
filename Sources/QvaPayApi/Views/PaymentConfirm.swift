//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import SwiftUI

public struct PaymentConfirm: View {
    @available(iOS 13.0.0, *)
    public init() {}
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        return VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
            Text("Request Payment")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.green)
            Text("Money have been deducted from your account and added to destination.")
                .foregroundColor(.gray)
                .padding()
            
            Divider()
            
            HStack{
                VStack(alignment: .leading){
                    Text("TIME")
                        .foregroundColor(.gray)
                    
                    Text("22:45")
                        .foregroundColor(Color.black.opacity(0.7))
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Date")
                        .foregroundColor(.gray)
                    Text("Fri 6 Dec,2019")
                        .foregroundColor(Color.black.opacity(0.7))
                        .fontWeight(.heavy)
                }
            }.padding()
            
            HStack{
                VStack(alignment: .leading){
                    Text("PAY to")
                        .foregroundColor(.gray)
                    Text("Tito Martinez")
                        .foregroundColor(Color.black.opacity(0.7))
                        .fontWeight(.heavy)
                    Text("831 664 2793")
                        .foregroundColor(Color.black.opacity(0.7))
                        .fontWeight(.heavy)
                    
                }
                Spacer()
                Image("Image")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                
            }.padding()
            HStack{
                VStack(alignment: .leading){
                    Text("AMOUNT")
                        .foregroundColor(.gray)
                    Text("$123")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    
                }
                Spacer()
                Text("Paid by QvaPay")
            }.padding()
            
            HStack{
                Button(action: {
                }) {
                    HStack{
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.white)
                        Text("PAY")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .background(Color.red)
                .cornerRadius(25)
            }
        }
    }
}


