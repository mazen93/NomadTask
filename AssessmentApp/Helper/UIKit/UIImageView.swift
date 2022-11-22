//
//  String.swift
//  BaseProject
//
//  Created by Ashwaq on 12/31/19.
//  Copyright © 2019 Selsela. All rights reserved.
//

import Foundation
import SDWebImage
import Optik

extension UIImageView {
    
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    
    func setImage(url: String? = "") {
        if let urlString = url, let url = URL(string: urlString) {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_imageIndicator?.startAnimatingIndicator()
            sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: .refreshCached)
        } else {
            image = UIImage(named: "placeholder")
        }
    }
}



class MyDownloader: Optik.ImageDownloader {
    func downloadImage(from url: URL, completion: @escaping ImageDownloaderCompletion) {
        SDWebImageDownloader.shared.downloadImage(with: url) { image, _, error, _ in
            guard error == nil else { return }
            guard let image = image else { return }
            completion(image)
        }
    }
}

extension UIImage {
    convenience init?(view: UIView) {
        // Based on https://stackoverflow.com/a/41288197/1118398
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }

        if let cgImage = image.cgImage {
            self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
        } else {
            return nil
        }
    }
}


