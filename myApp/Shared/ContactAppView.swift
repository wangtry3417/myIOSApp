import SwiftUI

struct ContactAppView: View {
    @State private var showActionAlert = false
    @State private var selectedContact = "張三"
    @State private var actionResult = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("聯絡人：\(selectedContact)")
                .font(.largeTitle)
            
            Button("選擇操作") {
                showActionAlert = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            if !actionResult.isEmpty {
                Text(actionResult)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .alert(isPresented: $showActionAlert) {
            Alert(
                title: Text("聯絡人操作"),
                message: Text("選擇對「\(selectedContact)」的操作"),
                primaryButton: .default(Text("打電話"), action: {
                    makePhoneCall()
                }),
                secondaryButton: .default(Text("發送訊息"), action: {
                    sendMessage()
                })
            )
        }
    }
    
    func makePhoneCall() {
        print("打電話給 \(selectedContact)...")
        // 模擬打電話
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            actionResult = "📞 已打電話給 \(selectedContact)"
        }
    }
    
    func sendMessage() {
        print("發送訊息給 \(selectedContact)...")
        // 模擬發送訊息
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            actionResult = "📱 已發送訊息給 \(selectedContact)"
        }
    }
}

struct ContactAppView_Previews: PreviewProvider {
    static var previews: some View {
        buttonView()
    }
}
