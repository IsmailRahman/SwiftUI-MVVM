//
//  MenuSplashView.swift
//  SwiftUI-MVVM
//
//  Created by Rome on 11/13/22.
//  Copyright © 2022 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct MenuSplashView: View {
    @State var selectionLogin: Int? = nil
    @State var selectionRegister: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack(spacing: 50.0) {
                    Image("MenuSplashScreen")
                    
                    VStack() {
                        HStack() {
                            Text("Experience new")
                                .foregroundColor(Color.white)
                                .font(.system(size: 36))
                                
                            Text("cities")
                                .foregroundColor(Color.globalButtonColor)
                                .font(.system(size: 36))
                        }
                        
                        HStack() {
                            Text("with new")
                                .foregroundColor(Color.white)
                                .font(.system(size: 36))
                            
                            Text("people")
                                .foregroundColor(Color.globalButtonColor)
                                .font(.system(size: 36))
                        }
                        .padding(.trailing, 80)
                    }
                    
                    VStack(spacing: 20.0) {
                        NavigationLink(destination: LoginSplashView(), tag: 1, selection: $selectionLogin) {
                                Button(action: {
                                    print("Hello, World !")
                                    self.selectionLogin = 1
                                }) {
                                    Text("LOGIN")
                                        .fontWeight(.medium)
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
                    
                        NavigationLink(destination: RegisterSplashView(), tag: 2, selection: $selectionRegister) {
                                Button(action: {
                                    print("Hello, World !")
                                    self.selectionRegister = 2
                                }) {
                                    Text("SIGN UP")
                                        .fontWeight(.medium)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .font(.system(size: 22))
                                        .padding()
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.white, lineWidth: 5)
                                    )
                                }
                                .background(Color.black) // If you have this
                                .cornerRadius(25)
                                .frame(maxWidth: UIScreen.main.bounds.size.width - 50, alignment: .bottom)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .accentColor(Color.black)
    }
}

#if DEBUG
struct MenuSplashView_Previes: PreviewProvider {
    static var previews: some View {
        MenuSplashView()
    }
}
#endif
