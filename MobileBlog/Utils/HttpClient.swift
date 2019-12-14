//
//  HttpProvider.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/17/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

class HttpClient: HTTPClient {
    
    private let baseAPIPath = "http://localhost:8080"
    
    //MARK:- Log in request
    func logIn(login: String,
               password: String,
               complitionHandler: @escaping (Result<AuthenticationInfo,HTTPClientError>) -> Void) {
        
        guard let urlRequest = makeRequest(type: .post,
                                           withPostfix: .login,
                                           parameters: nil,
                                           body: ["login":login, "password":password])
            else {
                complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: urlRequest) { (data, request, error) in

            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return
            }

            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
        

            let info = try? JSONDecoder().decode(AuthenticationInfo.self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
        }
        task.resume()
    }
    
    //MARK:- Registration request
    func registerUser(name: String,
                            userName: String,
                            password: String,
                            complitionHandler: @escaping (Result<UserInfo,HTTPClientError>) -> Void) {
        
        guard let urlRequest = makeRequest(type: .post,
                                           withPostfix: .usersOption,
                                           parameters: nil,
                                           body: ["login":name, "username": userName, "password":password])
            else {
                complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: urlRequest) { (data, request, error) in

            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return
            }

            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
        

            let info = try? JSONDecoder().decode(UserInfo.self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
        }
        task.resume()
    }

    
    // MARK:- Get publications requests
    
    func getPublications(complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
        
        guard let urlRequest = makeRequest(type: .get, withPostfix: .publicationsOption, parameters: nil, body: nil) else {
            complitionHandler(.failure(.urlGettingError))
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data,request,error in
            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return

            }
            
            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
            
            let info  = try? JSONDecoder().decode([PublicationInfo].self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
            
        }
        task.resume()
    }
    
    func getLikedPublications(userID: Int, complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void) {
        let patametersList = [String(userID),"likedPublications"]
        guard let urlRequest = makeRequest(type: .get, withPostfix: .publicationsOption, parameters: patametersList, body: nil) else {
            complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data,request,error in
            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return

            }
            
            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
            
            let info  = try? JSONDecoder().decode([PublicationInfo].self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
            
        }
        task.resume()
    }
    
    func getOwnPublications(userID: Int, complitionHandler: @escaping (Result<[PublicationInfo],HTTPClientError>) -> Void) {
        
        let patametersList = [String(userID),"ownPublications"]
        
        guard let urlRequest = makeRequest(type: .get, withPostfix: .publicationsOption, parameters: patametersList, body: nil) else {
            complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data,request,error in
            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return

            }
            
            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
            
            let info  = try? JSONDecoder().decode([PublicationInfo].self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
            
        }
        task.resume()
    }
    
    func postPublication(userID: Int, publicationName: String, publicationBody: String, complitionHandler: @escaping (Result<PublicationInfo, HTTPClientError>) -> Void) {
        
        let body = ["userID": String(userID), "name": publicationName, "body": publicationBody]
        
        guard let urlRequest = makeRequest(type: .post, withPostfix: .publicationsOption, parameters: nil, body: body) else {
            complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data,request,error in
            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return

            }
            
            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
            
            let info  = try? JSONDecoder().decode(PublicationInfo.self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
            
        }
        task.resume()
        
    }
    
    func updatePublication(userId: Int, publicationId: Int, updatedPublicatoinName: String, updatedPublicationBody: String, complitionHandler: @escaping (Result<PublicationInfo, HTTPClientError>) -> Void) {
        
        let parametersList = [String(publicationId)]
        let body = ["userID": String(userId), "name": updatedPublicatoinName, "body": updatedPublicationBody]
        
        guard let urlRequest = makeRequest(type: .put, withPostfix: .publicationsOption, parameters: parametersList, body: body) else {
            complitionHandler(.failure(.urlGettingError))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data,request,error in
            guard error == nil else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.sessionDataTaskError))
                }
                return

            }
            
            guard let responseData = data else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.emptyDataTaskError))
                }
                return
            }
            
            let info  = try? JSONDecoder().decode(PublicationInfo.self, from: responseData)
            
            guard let result = info else {
                DispatchQueue.main.async {
                    complitionHandler(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                complitionHandler(.success(result))
            }
            
        }
        task.resume()
        
        
    }
    // in case of success data not coming
    func deletePublication(UserId: Int, pubcliationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
        
    }
    
    func addPublicationToLiked(UserId: Int, publicationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
        
    }
    
    func removePublicationFromLiked(UserId: Int, publicationId: Int, complitionHandler: @escaping (Result<[PublicationInfo], HTTPClientError>) -> Void) {
        
    }
    
    //MARK:- Generete request function
    private func makeRequest(type: RequestType,
                      withPostfix postfix: UrlPostfix,
                      parameters: [String]?,
                      body:[String:String]?) -> URLRequest? {
        
        guard var url = URL(string: baseAPIPath + postfix.description) else {
            return nil
        }
        
        if let parametersList = parameters {
            for parameter in parametersList {
                url.appendPathComponent(parameter)
            }
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type.description
        
        if let requestBody = body {
            for data in requestBody {
                urlRequest.addValue(data.value, forHTTPHeaderField: data.key)
            }
        }
        return urlRequest
    }
    
}

// MARK:- Http errors enum
enum HTTPClientError: Error {
    case urlGettingError
    case sessionDataTaskError
    case emptyDataTaskError
    case decodingError
    
    var description: String {
        switch self {
        case .urlGettingError:
            return "Could not generate url"
        case .sessionDataTaskError:
            return "Data task throw an error"
        case .emptyDataTaskError:
            return "Could not get data from data task"
        case .decodingError:
            return "Could not docode data"
        }
    }
}

// MARK:- Url Postfixes enum
enum UrlPostfix {
    case usersOption
    case publicationsOption
    case login
    
    var description: String {
        switch self {
        case .usersOption:
            return "/api/users/"
        case .publicationsOption:
            return "/publications/"
        case .login:
            return "/api/users/login/"
        }
        
    }
}

//MARK:- Request type enum
enum RequestType {
    case get
    case post
    case put
    case delete
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
            }
        }
    }
