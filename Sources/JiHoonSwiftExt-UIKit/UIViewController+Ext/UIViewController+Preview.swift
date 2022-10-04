#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    
    @available(iOS 13.0, *)
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    @available(iOS 13.0.0, *)
    public func toPreview(_ devices : String...) -> some View {
        ForEach(devices, id: \.self){ deviceName in
            Preview(viewController: self)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
