//
//  SecondSplashView.swift
//  SwiftUI-MVVM
//
//  Created by Rome on 11/13/22.
//  Copyright © 2022 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct SecondSplashView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    Image("SecondSplashTopScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                    
                    Image("SecondSplashBottomScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: UIScreen.main.bounds.height / 2)
                }
            
                Text("New in town")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, UIScreen.main.bounds.height / 2 - 130)
                    .padding(.leading, 40)
                    .font(.system(size: 48))
                
                Text("Meet the best people wherever" + "\n" + "you traveler and truly experience")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, UIScreen.main.bounds.height / 2 - 70)
                    .padding(.leading, 40)
                    .font(.system(size: 16))
                
                Text("Local")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, UIScreen.main.bounds.height / 2 + 20)
                    .padding(.leading, 40)
                    .font(.system(size: 48))
                
                Text("Meet the most compatible international people")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, UIScreen.main.bounds.height / 2 + 80)
                    .padding(.leading, 40)
                    .font(.system(size: 16))
                
                VStack() {
                    NavigationLink(destination: MenuSplashView().navigationBarBackButtonHidden(true), tag: 1, selection: $selection) {
                            Button(action: {
                                print("Second Splash View!")
                                self.selection = 1
                            }) {
                                Text("NEXT")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 22))
                                    .padding()
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.globalButtonColor, lineWidth: 2)
                                )
                            }
                            .background(Color.globalButtonColor) // If you have this
                            .cornerRadius(25)
                            .frame(maxWidth: UIScreen.main.bounds.size.width - 50, alignment: .bottom)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 100)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

#if DEBUG
struct SecondSplashView_Previews : PreviewProvider {
    static var previews: some View {
        SecondSplashView()
    }
}
#endif
