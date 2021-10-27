//
//  ErrorView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/27.
//

import SwiftUI

struct ErrorView: View {
    @Binding var error: String
    @Binding var alert: Bool
    var body: some View {
        VStack {
            HStack {
                Text(self.error == "RESET" ? "Message" : "Error")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightPurple"))
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                .padding(.top)
                .padding(.horizontal, 25)
            
            Button(action: {
                alert.toggle()
            }){
                Text(self.error == "RESET" ? "Ok" : "Cancel")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 120)
            }
            .background(Color("lightPurple"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
        .frame(width: UIScreen.main.bounds.width - 70)
        .background(Color.white)
        .cornerRadius(15)
    }
}
