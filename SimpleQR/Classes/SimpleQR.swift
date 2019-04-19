//
//  SimpleQR
//
//  Created by José Miguel on 19/04/2019.
//  Copyright © 2019 José Miguel. All rights reserved.
//
import UIKit

public class SimpleQR {
    public static let shared = SimpleQR()
    
    public func imageQR(_ stringData: String) -> UIImage? {
        
        let data = stringData.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
       
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return nil }
        
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil }
        let processedImage = UIImage(cgImage: cgImage)
        
        return processedImage
    }
}
