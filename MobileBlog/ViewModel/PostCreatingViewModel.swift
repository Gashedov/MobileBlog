//
//  PostCreatingViewModel.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 12/8/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

class PostCreatingViewModel {
    weak var delegate: ViewModelDelegate?
    var httpClient: HTTPClient
    private var verifier: Verifier
    
    var data: PublicationInfo?
    var error: PublicationDataReceivingError?
    
    init() {
        httpClient = HttpClient()
        verifier = Verifier()
    }
    
    func sendPublicationToServer(publicationName: String, publicationBody: String) {
        guard verifier.publicationNameIsCorrect(name: publicationName) else {
            error = .invalidPublicationName
            delegate?.couseAnError()
            return
        }
        
        guard verifier.publicationBodyIsCorrect(body: publicationBody) else {
            error = .invalidPublicationBody
            delegate?.couseAnError()
            return
        }
        
        let userID = UserDefaults.standard.integer(forKey: "userID")
        
        httpClient.postPublication(userID: userID, publicationName: publicationName, publicationBody: publicationBody) { result in
            switch result {
            case .failure(let error):
                NSLog(error.description)
                self.error = .serverRejecting
                self.delegate?.couseAnError()
            
            case .success(let info):
                self.data = info
                self.delegate?.dataRecieve()
            }
        }
    }
}
