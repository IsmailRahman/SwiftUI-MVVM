//
//  LoginSplashView.swift
//  SwiftUI-MVVM
//
//  Created by Rome on 11/13/22.
//  Copyright © 2022 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        let controller = UIViewController()
        DispatchQueue.main.async {
            if let navigationController = controller.navigationController {
                self.configure(navigationController)
                print("Successfully obtained navigation controller")
            } else {
                print("Failed to obtain navigation controller")
            }
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
    }
}

struct LoginSplashView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var selectionForgotPassword: Int? = nil
    @State var selectionRegister: Int? = nil
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.orange
    }
    
    var body: some View {
        NavigationView {
            ZStack() {
                HStack() {
                    Image("LoginScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(Color.black)
                        .opacity(0.9)
                }
                 
                ScrollView {
                    VStack() {
                        Image("Logo")
                        
                        Text("Welcome back!")
                            .font(.system(size: 45))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        
                        VStack(spacing: 20.0) {
                            ZStack(alignment: .leading) {
                                HStack() {
                                    FontIcon
                                        .text(.materialIcon(code: )(code: .email), fontsize: 30)
                                        .foregroundColor(Color.black.opacity(0.7))
                                    if username.isEmpty {
                                        Text("Email")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color.black.opacity(0.7))
                                    }
                                    TextField("", text: $username)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width - 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            
                            ZStack(alignment: .leading) {
                                HStack() {
                                    FontIcon
                                        .text(.materialIcon(code: .lock), fontsize: 33)
                                        .foregroundColor(Color.black.opacity(0.7))
                                    if password.isEmpty {
                                        Text("Password")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color.black.opacity(0.7))
                                    }
                                    SecureField("", text: $password)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width - 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            
                            HStack() {
                                Text("Forgot password?")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 16))
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width - 70, alignment: .trailing)
                            
                            HStack() {
                                Button(action: {
                                    print("Login Submitted !")
                                }) {
                                    Text("LOGIN")
                                        .fontWeight(.medium)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .font(.system(size: 22))
                                        .padding()
                                        .foregroundColor(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 40)
                                                .stroke(Color.white, lineWidth: 3)
                                    )
                                }
                                .background(Color.globalButtonColor) // If you have this
                                .cornerRadius(40)
                                .frame(maxWidth: UIScreen.main.bounds.size.width - 50, alignment: .bottom)
                            }
                            .padding(.top, 50)
                            
                            HStack() {
                                Text("Don't have an account?")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                NavigationLink(destination: RegisterSplashView(), tag: 2, selection: $selectionRegister) {
                                    Button(action: {
                                        self.selectionRegister = 2
                                    }) {
                                        Text("Sign up")
                                            .foregroundColor(Color.globalButtonColor)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 100)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 130)
                }
                .background(NavigationConfigurator { navigationConfigurator in
                    navigationConfigurator.hidesBarsOnSwipe = true
                })
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

#if DEBUG
struct LoginSplashView_Previes: PreviewProvider {
    static var previews: some View {
        LoginSplashView()
    }
}
#endif
