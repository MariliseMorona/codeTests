//
//  ContentView.swift
//  codeTest
//
//  Created by marilise morona on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: CodeViewModel
    
    init(viewModel: CodeViewModel){
        self.viewModel = viewModel
    }
    
    
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.brown)
                VStack {
                    Text("Insert your age:")
                        .fontWeight(.bold)
                    TextField("", text: viewModel.bindings.ageUser)
                        .frame(width: 150, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.primary.opacity(0.5), lineWidth: 2))
                    Text(viewModel.state.message)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Button("Valid") {
                        viewModel.validAgeUser()
                    }.foregroundColor(.black)
                        .frame(width: 150, height: 45)
                        .fontWeight(.medium)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.primary.opacity(0.5), lineWidth: 3))
                        .disabled(!viewModel.changeStateButton())
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(
            initialState: .init()))
    }
}
