//
//  HomeViewModel.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/29/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

// this is not the best solution, but the fastest to implement
// best solution is to do view controllers with tabel view for each data set
// load data onse and hold it sinse user deside to update it

///This view model hange the data set throught changeDataSet function
/// property data hold current set of data and change it when needs
class HomeViewModel {
    weak var delegate: ViewModelDelegate!
    var data: [PublicationInfo] = []
    private let httpClient = HttpClient()

    ///This fucntion load common for authorized and unauthorized users publications.
    ///That's why it public
    func getData() {
        httpClient.getPublications{ result in
            switch result {
            case .success(let publicationList):
                
                self.data = publicationList
                self.delegate?.dataRecieve()
            case .failure(let error):
                NSLog("HTTP error:" + error.description)
            }
        }
    }
    
    private func getLikedPublications() {
        let userId = UserDefaults.standard.integer(forKey: "userID")
        guard userId != 0 else {
            NSLog("Getting user id error: Could't get user id from user defaults ")
            return
        }
        httpClient.getLikedPublications(userID: userId) { (result) in
            switch result {
            case .success(let publicationList):
                
                self.data = publicationList
                self.delegate?.dataRecieve()
            case .failure(let error):
                NSLog("HTTP error:" + error.description)
            }
        }
    }
    
    private func getOwnPublications() {
        
        let userId = UserDefaults.standard.integer(forKey: "userID")
        guard userId != 0 else {
            NSLog("Getting user id error: Could't get user id from user defaults ")
            return
        }
        httpClient.getLikedPublications(userID: userId) { (result) in
            switch result {
            case .success(let publicationList):
                
                self.data = publicationList
                self.delegate?.dataRecieve()
            case .failure(let error):
                NSLog("HTTP error:" + error.description)
            }
        }
    }
    
    func changeDataSet(to option: PublicationDataOption) {
        switch option {
        case .allPublications:
            getData()
            
        case .likedPublications:
            getLikedPublications()
            
        case .ownPublications:
            getOwnPublications()
        }
    }
}
