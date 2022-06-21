//
//  SearchViewController.swift
//  IOTD
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit


class SearchViewController: UIViewController {

    @IBOutlet weak var fetchImageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var searchBtnOutlet: UIButton!
    var searchPresenter:SearchPresenting?
    var chosenDate: Date?
    var imageResponse: SearchImageModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchImageActivityIndicator.isHidden = true
        setUpModule()
        chosenDate = Date()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopProgressIndicator()
    }
    
    func setUpModule() {
        let interactor = SearchInteractor()
        let router = SearchRouter(viewController: self)
        var presenter = SearchPresenter(searchInteracting: interactor,
                                        searchRouting: router,
                                        searchViewing: self)
        
        self.searchPresenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = self
    }
    


    @IBAction func dateSelected(_ sender: Any) {
        guard let isDateValid = self.presenter?.validateDate(pickedDate: datePicker.date),
              isDateValid == true else {
            chosenDate = Date()
            displayError(error:AlertMessages.futureDate.rawValue)
            return
        }
        chosenDate =  datePicker.date
    }

    @IBAction func SearchButtonTap(_ sender: Any) {
        startProgressIndicator()
        self.searchPresenter?.getImage(for: chosenDate )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let response = self.imageResponse else {
            return
        }
        let destVC = segue.destination as? ImageDetailsViewController
        destVC?.viewModel.imageModel.response = response
        destVC?.viewModel.imageModel.isFavourite = false
    }
    
    func startProgressIndicator() {
        fetchImageActivityIndicator.isHidden = false
        fetchImageActivityIndicator.startAnimating()
        datePicker.isUserInteractionEnabled = false
        searchBtnOutlet.isUserInteractionEnabled = false
    }
    
    func stopProgressIndicator() {
        fetchImageActivityIndicator.stopAnimating()
        fetchImageActivityIndicator.isHidden = true
        datePicker.isUserInteractionEnabled = true
        searchBtnOutlet.isUserInteractionEnabled = true
    }
}

extension SearchViewController: SearchViewing
{
    var presenter: SearchPresenting? {
        get {
            return searchPresenter
        }
        set {
        }
    }
    
    func displayError(error: String) {
        //Display error as pop up.
        DispatchQueue.main.async {
            self.stopProgressIndicator()
        }
        showAlert(message: error)
    }
    
    func displayResult(model: SearchImageModel) {
        self.imageResponse = model
        DispatchQueue.main.async {
            self.stopProgressIndicator()
        }
    }
    
    
}
