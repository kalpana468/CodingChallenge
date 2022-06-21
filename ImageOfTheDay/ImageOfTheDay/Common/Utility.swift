//
//  Utility.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        // Return the cached image if available
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        } else {
            //download from internet.
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.hidesWhenStopped = true
            activityIndicator.center = CGPoint(x:self.frame.width/2,
                                               y: self.frame.height/2)
            DispatchQueue.main.async {
                activityIndicator.startAnimating()
                self.addSubview(activityIndicator)
            }
            DownloadService().downloadImage(imageUrlStr: urlString) { imageData , error in
                DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                    if let data = imageData, let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    } else {
                        //TODO: handle error
                    }
                }
            }
        }
    }
}
//TODO: change it to computedvars
extension Date {
    
    func convertDateToString(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = YYYYMMDDdateFormat
        dateFormatter.timeZone = TimeZone(identifier: "GMT")!
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: date)
    }
    
    func daysBetween(newDate: Date) -> Int? {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "GMT")!
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: newDate)
        let components = calendar.dateComponents([Calendar.Component.day], from: date1, to: date2)
        return components.day
    }
    
}

extension UIViewController {

    func showToastMessage(message: String, seconds: Double, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

    func  showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
