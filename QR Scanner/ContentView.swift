import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // QR 코드 스캐너 뷰
            QRCodeScannerView()
                .frame(width: 350, height: 153)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
