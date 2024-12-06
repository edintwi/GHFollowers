//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Edson Brandon on 02/12/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername        = "This username created a invalid request. Please try again"
    case unableToComplete       = "Unable to complete your request. Please check your network connection."
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data recived from the server is invalid. Please try again"
    case unableToFavorite       = "Unable to favorite this user. Please try again."
    case alreadyFavorite        = "This user is already favorited."
}
