//
//  PostCreatingViewModelTest.swift
//  MobileBlogTests
//
//  Created by Artem Gorshkov on 12/8/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import XCTest
@testable import MobileBlog

class PostCreatingViewModelTest: XCTestCase {
    
    var sut: PostCreatingViewModel?
    var delegateMock: ViewModelDelegateMock?
    var httpClientMock: HttpClientMock?

    override func setUp() {
        sut = PostCreatingViewModel()
        let delegate = ViewModelDelegateMock()
        delegateMock = delegate
        httpClientMock = HttpClientMock()
        sut?.delegate = delegateMock
        sut?.httpClient = httpClientMock!
    }

    override func tearDown() {
        sut = nil
        delegateMock = nil
        httpClientMock = nil
    }
    
    func testPostCreationViewModelInvalidPublicationNameSendError(){
        let publicationName = "??"
        let publicationBody = "publication body test should be seventy characters lenght or more, but not less than seventy"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(sut?.error, PublicationDataReceivingError.invalidPublicationName)
        
    }
    
    func testPostCreationViewModelInvalidPublicationBodySendError() {
        let publicationName = "publication name test"
        let publicationBody = "??"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(sut?.error, PublicationDataReceivingError.invalidPublicationBody)
    }
    
    func testPostCreationViewModelValidInputSendData() {
        let publicationName = "publication name test"
        let publicationBody = "publication body test should be seventy characters lenght or more, but not less than seventy"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(sut?.data, PublicationInfo(id: 0, name: publicationName, body: publicationBody, userID: 0))
    }
    
    func testPostCreationViewModelValidInputCallsDelegateSuccessMethod() {
        let publicationName = "publication name test"
        let publicationBody = "publication body test should be seventy characters lenght or more, but not less than seventy"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(delegateMock?.dataRecieveCounter, 1)
    }
    
    func testPostCreationViewModelInvalidPublicationNameCallsDelegateErrorMethod() {
        let publicationName = "??"
        let publicationBody = "publication body test should be seventy characters lenght or more, but not less than seventy"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
    }
    
    func testPostCreationViewModelInvalidPublicationBodyCallsDelegateErrorMethod() {
        let publicationName = "publication name test"
        let publicationBody = "???"
        
        sut?.sendPublicationToServer(publicationName: publicationName, publicationBody: publicationBody)
        
        XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
    }
    
    
}
