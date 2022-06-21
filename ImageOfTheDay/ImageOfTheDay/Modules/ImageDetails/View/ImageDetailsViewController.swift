//
//  ImageDetailsViewController.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import UIKit

class ImageDetailsViewController: UIViewController {
    
    @IBOutlet weak var ImageOfTheDay: UIImageView!
    @IBOutlet weak var explanationTextView: UITextView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var imageLoadingIndicator: UIActivityIndicatorView!
    var viewModel = ImageDetailsViewModel()
    
    @IBAction func favButtonTapped(_ sender: Any) {
        //TODO: Remove from fav if it is unselected.
        self.favButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        do {
            try viewModel.imageMarkedFav()
            showToastMessage(message: ToastMessages.itemMarkedFav.rawValue,
                             seconds: ToastTimer.favToastMsgTimer.rawValue,
                             title: ToastTitle.itemMarkedFav.rawValue)
        } catch let error {
            if let err = error as? CacheError, err  == CacheError.saveToCacheFailed {
                showAlert(message: AlertMessages.favExistsAlready.rawValue)
            } else {
                showAlert(message: AlertMessages.itemMarkedFavFailed.rawValue)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        setUpView(model: viewModel.imageModel)
    }
    
    func setUpView(model:ImageDetailModel) {
        self.favButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        self.dateLbl.text = model.response?.date
        self.titleLbl.text = model.response?.title
        self.explanationTextView.text = model.response?.explanation
        
        if let imageUrl = model.response?.url, model.response?.media_type == MediaType.image.rawValue  {
            self.ImageOfTheDay.loadImage(withUrl: imageUrl)
        }
    }
}
