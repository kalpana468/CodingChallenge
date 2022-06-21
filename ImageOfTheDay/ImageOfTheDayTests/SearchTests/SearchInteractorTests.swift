//
//  SearchInteractorTests.swift
//  ImageOfTheDayTests
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import XCTest
@testable import ImageOfTheDay

class SearchInteractorTests: XCTestCase {

        var interactor: SearchInteractor?

        override func setUp() {
            interactor = SearchInteractor()
        }

        override func tearDown() {
            interactor = nil
        }
    
    func testGetFavouritesList() {
        let mockDate = "2022-06-21"
        interactor?.fetchImageFromApi(for: mockDate) { imageModel,errorStr in
            XCTAssertNotNil(imageModel,"Data is mocked so there should be proper image model.")
            XCTAssertNil(errorStr, "Data is mocked so there should be no errors.")
            XCTAssertEqual(imageModel?.date, mockDate, "Date from json should be same as the response")
        }
    }
}
