import SwiftUI
import CoreImage

struct QRCodeScannerView: View {
    @State private var decodedMessage: String = "QR 코드를 스캔하세요" // test
    
    var body: some View {
        VStack {
            Text(decodedMessage)
                .font(.headline)
                .padding()
            
            Button("이미지 파일 선택") {
                selectImage()
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }
    
    func selectImage() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.image]
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.title = "QR 코드 이미지 선택"
        
        if panel.runModal() == .OK, let url = panel.url {
            decodeQRCode(from: url)
        }
    }
    
    func decodeQRCode(from url: URL) {
        guard let ciImage = CIImage(contentsOf: url) else {
            decodedMessage = "이미지를 로드할 수 없습니다."
            return
        }

        let context = CIContext()
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])

        guard let features = detector?.features(in: ciImage) as? [CIQRCodeFeature], !features.isEmpty else {
            decodedMessage = "QR 코드가 감지되지 않았습니다."
            return
        }

        if let message = features.first?.messageString {
            decodedMessage = "QR 코드 내용: \(message)"
            openURL(message)
        }
    }
    
    func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            NSWorkspace.shared.open(url)
        } else {
            decodedMessage = "유효하지 않은 URL: \(urlString)"
        }
    }
}
