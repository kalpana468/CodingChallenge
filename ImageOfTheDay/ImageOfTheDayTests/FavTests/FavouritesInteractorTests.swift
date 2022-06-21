//
//  FavouritesInteractorTests.swift
//  ImageOfTheDayTests
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//


import XCTest
@testable import ImageOfTheDay

class FavouritesInteractorTests: XCTestCase {
    var interactor: FavouriteInteractor!
    
    override func setUp() {
        interactor = FavouriteInteractor()
    }
    
    override func tearDown() {
        interactor = nil
    }
    
    func testGetFavouritesList() {
        interactor.getFavouritesList {data , error in
            XCTAssertNotNil(data,"Data is mocked so there should be 2 favs.")
            XCTAssertNil(error, "Data is mocked so there should be no errors.")
            XCTAssertEqual(data?.count, 2, "Number of favs  needs to come as 2")
        }
    }
}

