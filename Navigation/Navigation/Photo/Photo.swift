//
//  Photo.swift
//  Navigation
//
//  Created by Юрий Филатов on 29.03.2022.
//

import UIKit

struct Photo {
    let picture: String
    
    static func addPicture() -> [Photo] {
        var array = [Photo]()
        
        for x in 1...15 {
            array.append(Photo(picture: String(x)))
        }
        return array
    }
    
    static func addImage() -> [UIImage] {
        var array = [UIImage]()
        
        for x in 1...15 {
            array.append(UIImage(named: String(x))!)
        }
        
        return array
    }
    
}
