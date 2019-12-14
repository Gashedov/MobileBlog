//
//  RegirstrationViewModelTest.swift
//  MobileBlogTests
//
//  Created by Artem Gorshkov on 12/6/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import XCTest
@testable import MobileBlog

class RegirstrationViewModelTest: XCTestCase {
    
    var sut: RegistrationViewModel?
    var delegateMock: ViewModelDelegateMock?
    var httpClientMock: HttpClientMock?

    override func setUp() {
        sut = RegistrationViewModel()
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
    
    func testRegistrationViewModelInvalidNameSendError() {
        let name = "???"
        let userName = "POslannikIIsusa"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(sut?.error, DataReceivingError.invalidLogin)
    }
    
    func testRegistrationViewModelInvalidUserNameSendError() {
        let name = "Oleg"
        let userName = "???"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(sut?.error, DataReceivingError.invalidLogin)
    }
    
    func testRegistrationViewModelInvalidPasswordSendError() {
        let name = "Oleg"
        let userName = "POslannikIIsusa"
        let password = "??"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(sut?.error, DataReceivingError.invalidPassword)
    }
    
    func testRegistrationViewModelDifferentPasswordsSendError() {
        let name = "Oleg"
        let userName = "POslannikIIsusa"
        let password = "password"
        let passwordConfirmation = "passwort"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(sut?.error, DataReceivingError.passwordsAreNotEqual)
    }
    
    
    func testRegistrationViewModelValidInputSendUserData() {
        let name = "Oleg"
        let userName = "POslannikIIsusa"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(sut?.data, UserInfo(id: 0, name: name, username: userName))
    }
    
    func testRegistrationViewModelValidInputCallsDelegateSuccessMethod() {
        let name = "Oleg"
        let userName = "POslannikIIsusa"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(delegateMock?.dataRecieveCounter, 1)
    }
    
    func testRegistrationViewModelInvalidNameCallsDelegateErrorMethod() {
        let name = "???"
        let userName = "POslannikIIsusa"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
    }
    
    func testRegistrationViewModelInvalidUserNameCallsDelegateErrorMethod() {
        let name = "Oleg"
        let userName = "???"
        let password = "password"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
    }
    
    func testRegistrationViewModelInvalidPasswordCallsDelegateErrorMethod() {
        let name = "Oleg"
        let userName = "POslannikIIsusa"
        let password = "??"
        let passwordConfirmation = "password"
        
        sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
        
        XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
    }
    
    func testRegistrationViewModelDifferentPasswordsCallsDelegateErrorMethod() {
           let name = "Oleg"
           let userName = "POslannikIIsusa"
           let password = "?password"
           let passwordConfirmation = "password"
           
           sut?.register(name: name , userName: userName , password: password, passwordConfirmation: passwordConfirmation)
           
           XCTAssertEqual(delegateMock?.couseAnErrorCounter, 1)
       }
}

