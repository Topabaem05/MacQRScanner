import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // QR 코드 스캐너 뷰1
            QRCodeScannerView()
                .frame(width: 350, height: 153)
                .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
