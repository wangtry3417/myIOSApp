//
//  button.swift
//  myApp
//
//  Created by students on 6/12/2025.
//

import SwiftUI

struct buttonView : View {
    @State private var showAlert = false
    var body: some View {
        VStack(spacing: 30) {
            Button("提交") {
                showAlert = true
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("請確認"), message: Text("確認要提交嗎？"), primaryButton: .destructive(Text("刪除")), secondaryButton: .cancel())
        })
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        buttonView()
    }
}
