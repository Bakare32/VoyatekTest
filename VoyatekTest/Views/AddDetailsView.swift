//
//  AddDetailsView.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import SwiftUI
import UIKit


extension Font {
    static func themeFont(fontStyle: ThemeFontStyle, size: Size) -> Font {
        return Font.custom(fontStyle.rawValue, size: size.rawValue)
    }
}

enum ThemeFontStyle: String {
    case satoshiMedium = "Satoshi-Medium"
}

enum Size: CGFloat {
    case size8  =  8
    case size10 = 10
    case size11 = 11
    case size12 = 12
    case size13 = 13
    case size14 = 14
    case size15 = 15
    case size16 = 16
    case size17 = 17
    case size18 = 18
    case size20 = 20
    case size24 = 24
    case size22 = 22
    case size25 = 25
    case size26 = 26
    case size28 = 28
    case size30 = 30
    case size32 = 32
    case size34 = 34
    case size36 = 36
    case size40 = 40
    case size46 = 46
    case size50 = 50
    case size60 = 60
}


struct AddDetailsView: View {
    
    @State private var name: String = ""
    @State private var description: String = ""
    
    @State private var selectedDelicaies: String = "Select Category"
    
    var dismissAction: (() -> Void)?
    
    let delicaies = ["Dawn Delicacies", "Delicacies", "Sweet Delicacies", "Nice Delicacies"]
    
    var body: some View {
        VStack {
            navBar
            ScrollView {
                VStack {
                    secondView
                    fields
                    Spacer()
                    Spacer()
                    button
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("Details")
    }
    
    
    private var navBar: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    print("Hello")
                    dismissAction?()
                } label: {
                    Image("back_icon")
                }
                .buttonStyle(PlainButtonStyle())
                .scaleEffect(1.5)
                .frame(width: 40)
                .frame(height: 40)
                
                Text("Payment History")
                    .font(.themeFont(fontStyle: .satoshiMedium, size: .size16))
                    .padding(.leading, 10)
                
                Spacer(minLength: 0)
            }
            Divider()
                .padding(.top, 20)
        }
        .padding([.horizontal, .top], 20)
    }
    
    private var secondView: some View {
        HStack(spacing: 16) {
            RectangleView(imageName: "camera", text: "First")
            RectangleView(imageName: "upload", text: "Second")
        }
        .padding()
    }
    
    private var fields: some View {
        VStack(alignment: .leading, spacing: 8) {
            CustomTextField(title: "Name", placeholder: "Enter name", text: $name, height: 50)
            
            CustomTextField(title: "Descripton", placeholder: "Enter food description", text: $name, height: 104)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Category")
                    .font(.themeFont(fontStyle: .satoshiMedium, size: .size12))
                    .foregroundColor(Color(hex: "#1D2433"))
                
                Menu {
                    ForEach(delicaies, id: \.self) { category in
                        Button(category) {
                            selectedDelicaies = category
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedDelicaies)
                            .foregroundColor(selectedDelicaies == "Dawn Delicacies" ? Color(hex: "#98A2B3") : Color(hex: "#98A2B3"))
                            .font(.themeFont(fontStyle: .satoshiMedium, size: .size12))
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                }
            }
            
            CustomTextField(title: "Calories", placeholder: "Enter number of calories", text: $name, height: 50)
            
            CustomTextField(title: "Tags", placeholder: "Add a tag", text: $name, height: 50)
            Text("Press enter once you've typed a tag.")
                .foregroundColor(Color(hex: "#98A2B3"))
                .font(.themeFont(fontStyle: .satoshiMedium, size: .size12))
            
        }
        .padding()
    }
    
    private var button: some View {
        
        Button(action: {
            print("Button tapped!")
        }) {
            Text("Add Food")
                .foregroundColor(Color(hex: "#98A2B3"))
                .font(.themeFont(fontStyle: .satoshiMedium, size: .size12))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#E7F0FF"))
                .cornerRadius(4)
        }
        .padding()
    }
    
    
}

struct RectangleView: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.themeFont(fontStyle: .satoshiMedium, size: .size14))
                .foregroundColor(Color(hex: "#1D2433"))
        }
        .frame(width: 175, height: 90)
        .background(Color.clear)
        
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#E4E7EC"), lineWidth: 1)
        )
        .cornerRadius(10)
    }
}



#Preview {
    AddDetailsView()
}
