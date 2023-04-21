//
//  UIImageView + Extension.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit
import Kingfisher

//MARK:- Download image from Url
extension UIImageView{
    
    private func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                self?.contentMode = mode
                self?.backgroundColor = .clear
            }
        }.resume()
    }
    
    func download(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
