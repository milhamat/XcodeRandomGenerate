//
//  QRCodeView.swift
//  TitikJumpaAdmin
//
//  Created by Sufiandy Elmy on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins
import AppKit

struct QRCodeView : View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url : String
    
    var body:some View{
        Image(nsImage: genrateQRImage(_url: url))
            .interpolation(.none)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
    }
 
    func genrateQRImage(_url:String) -> NSImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
            return NSImage(cgImage: qrCodeCGImage, size: NSZeroSize)
           }
        }
        
        return NSImage()
            //return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

