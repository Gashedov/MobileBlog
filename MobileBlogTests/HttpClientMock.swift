//
//  HttpClientMock.swift
//  MobileBlogTests
//
//  Created by Artem Gorshkov on 12/8/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation
@testable import MobileBlog

class HttpClientMock: HTTPClient {
    func logIn(login: String, password: String, complitionHandler: @escaping (Result<AuthenticationInfo, HTTPClientError>) -> Void) {
    }
    
    func getOwnPublications(userID: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func getLikedPublications(userID: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func getPublications(complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func postPublication(userID: Int, publicationName: String, publicationBody: String, complitionHandler: @escaping (Result<PublicationInfo, HTTPClientError>) -> Void) {
        complitionHandler(.success(PublicationInfo(id: 0, name: publicationName, body: publicationBody, userID: 0)))
    }
    
    func updatePublicatoin(userId: Int, publicationId: Int, updatedPublicatoinName: String, updatedPublicationBody: String, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func deletePublication(UserId: Int, pubcliationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func addPublicationToLiked(UserId: Int, publicationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    func removePublicationFromLicked(UserId: Int, publicationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
    }
    
    // just need to enshure that this method was called
    func registerUser(name: String, userName: String, password: String, complitionHandler: @escaping (Result<UserInfo, HTTPClientError>) -> Void) {
        complitionHandler(.success(UserInfo(id: 0, name: name, username: userName)))
    }
}
