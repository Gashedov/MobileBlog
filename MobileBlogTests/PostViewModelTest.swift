//
//  PostViewModel.swift
//  MobileBlogTests
//
//  Created by Artem Gorshkov on 12/18/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import XCTest
@testable import MobileBlog

class PostViewModel: XCTestCase {
    
    var sut: PostViewModel?
    var delegateMock: ViewModelDelegateMock?
    var httpClientMock: HttpClientMock?
    
    override func setUp() {
        sut = PostViewModel()
        delegateMock = ViewModelDelegateMock()
        httpClientMock = HttpClientMock()
        sut?.delegate = delegateMock
        sut?.httpClient = httpClientMock!
    }

    override func tearDown() {
        sut = nil
        delegateMock = nil
        httpClientMock = nil
    }
    
    func testAddPublicationToLikedValidCallingCallsDelegateSuccess(){
        let publicationId = 0
        
    }

}
