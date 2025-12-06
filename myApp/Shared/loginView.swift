//  loginView.swift
//  myApp
//
//  Created by students on 6/12/2025.
//

import SwiftUI

struct loginView: View {
    @State private var username = ""
    @State private var applyPos = ""
    
    enum ActiveAlert: Identifiable {
        case confirmation, success, cancel
        
        var id: Int {
            switch self {
            case .confirmation: return 0
            case .success: return 1
            case .cancel: return 2
            }
        }
    }

    @State private var activeAlert: ActiveAlert? = nil
    
    var body: some View {
        VStack {
            Text("員工註冊申請")
                .bold()
                .underline()
                .foregroundColor(.blue)
            TextField("輸入你的名字", text: $username)
                .padding()
            TextField("輸入申請崗位", text: $applyPos)
                .padding()
            Button("提交") {
                activeAlert = .confirmation
                print("提交按鈕被點擊，準備顯示確認 Alert")
            }
            .padding()
            .background(username.isEmpty || applyPos.isEmpty ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.top, 20)
            .disabled(username.isEmpty || applyPos.isEmpty)
            
            Spacer()
            
            // Show input-content
            if !username.isEmpty || !applyPos.isEmpty {
                VStack {
                   Text("預覽: ")
                    .font(.headline)
                   Text("姓名: \(username)")
                   Text("崗位: \(applyPos)")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding()
            }
        }
        .alert(item: $activeAlert) { alertType in
            switch alertType {
            case .confirmation:
                return Alert(
                    title: Text("提交確認"),
                    message: Text("請注意，此提交會提交到真正server"),
                    primaryButton: .default(Text("提交"), action: {
                        // 提交後清空輸入框，並顯示成功 Alert
                        username = ""
                        applyPos = ""
                        activeAlert = .success
                        print("確認 Alert - 提交")
                    }),
                    secondaryButton: .cancel(Text("取消"), action: {
                        // 取消後清空輸入框，並顯示取消 Alert
                        username = ""
                        applyPos = ""
                        activeAlert = .cancel
                        print("確認 Alert - 取消")
                    })
                )
            case .success:
                return Alert(
                    title: Text("已經順利提交 "),
                    message: Text("已經順利提交！\n申請編號：EMP\(Int.random(in: 10000...99999))"),
                    dismissButton: .default(Text("確定"), action: {
                        print("成功 Alert - 確定")
                    })
                )
            case .cancel:
                return Alert(
                    title: Text("已取消"),
                    message: Text("已經取消提交"),
                    dismissButton: .default(Text("確定"), action: {
                        print("取消 Alert - 確定")
                    })
                )
            }
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
