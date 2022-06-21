//
//  FavouriteViewController.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var favouriteListTblView: UITableView!
    var favListarray : [ImageDetails] = []
    var favPresenter:FavouritePresenting?
    
    override func viewDidLoad() {
        setUpModule()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.favPresenter?.getFavouritesList()
    }
    
    func setUpModule() {
        let interactor = FavouriteInteractor()
        let router = FavouriteRouter(viewController: self)
        var presenter = FavouritePresenter(favInteracting: interactor,
                                           favRouting: router,
                                           favViewing: self)
        
        self.favPresenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = self
    }
}

extension FavouriteViewController: FavouriteViewing {
    func displayError(error: String) {
        showToastMessage(message: error,
                         seconds: ToastTimer.noFavToastMsgTimer.rawValue,
                         title: ToastTitle.noFavsToLoad.rawValue
        )
    }
    
    func displayResult(model: [ImageDetails]) {
        favListarray = model
        self.favouriteListTblView.reloadData()
    }

}

extension FavouriteViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favListarray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let favourites = favListarray[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FavCell",
            for: indexPath) as? FavouriteCustomCell else {
            fatalError("Error Dequeing Cell")
    }
    cell.favImageTitleLbl.text = favourites.value(forKeyPath: "imgTitle") as? String
    cell.favImgDateLbl.text = favourites.value(forKeyPath: "imgDate") as? String
    
    if let imageUrl = favourites.value(forKeyPath: "imgUrl") as? String, favourites.value(forKeyPath: "imgMediaType") as? String == MediaType.image.rawValue
    {
        cell.favImageView.loadImage(withUrl: imageUrl )
        cell.setNeedsLayout()
    } else {
        //TODO: set a default image
    }
    return cell
  }
}
