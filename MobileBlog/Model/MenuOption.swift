//
//  MenuOption.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/16/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

/// class describes model of left side menu
enum MenuOptions : Int, CustomStringConvertible {
    
    case Posts
    case MyPosts
    case LikedPosts
    case NewPost
    
    /// property describe name of all options
    var description: String {
        switch self {
            
        case .Posts:
            return "Posts"
        case .MyPosts:
            return "My posts"
        case .LikedPosts:
            return "Liked posts"
        case .NewPost:
            return "New post"
        }
    }
    
    /// property descrinbe images of all options
    var image: UIImage {
        switch self {
            
        case .Posts:
            return UIImage(named:"ic_person_outline_white_2x") ?? UIImage()
        case .MyPosts:
            return UIImage(named:"ic_mail_outline_white_2x") ?? UIImage()
        case .LikedPosts:
            return UIImage(named:"baseline_settings_white_24dp") ?? UIImage()
        case .NewPost:
            return UIImage(named:"baseline_settings_white_24dp") ?? UIImage()

        }
    }
}
