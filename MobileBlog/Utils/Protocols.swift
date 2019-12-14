//
//  Protocols.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

protocol HomeControllerDelegate: class {
    func handleMenuToggle(menuOption: MenuOptions?)
}

protocol ViewModelDelegate: class {
    func dataRecieve()
    func couseAnError()
}

/// protocol describes all behaviour of httpClient classes
/// must have all methods that needed to make a CRUD requests and accept data
protocol HTTPClient: class {
    func registerUser(name: String,
                    userName: String,
                    password: String,
                    complitionHandler: @escaping (Result<UserInfo,HTTPClientError>) -> Void)
    
    func logIn(login: String,
               password: String,
               complitionHandler: @escaping (Result<AuthenticationInfo,HTTPClientError>) -> Void)
    
    func getOwnPublications(userID: Int,
                            complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
    func getLikedPublications(userID: Int,
                              complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
    func getPublications(complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void)
    
    func postPublication(userID: Int,
                         publicationName: String,
                         publicationBody: String,
                         complitionHandler: @escaping (Result<PublicationInfo,HTTPClientError>) -> Void)
    
    func updatePublication(userId: Int,
                           publicationId: Int,
                           updatedPublicatoinName: String,
                           updatedPublicationBody: String,
                           complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
    func deletePublication(UserId: Int,
                           pubcliationId: Int,
                           complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
    func addPublicationToLiked(UserId: Int,
                             publicationId: Int,
                             complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
    func removePublicationFromLicked(UserId: Int,
                                     publicationId: Int,
                                     complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void)
    
}
