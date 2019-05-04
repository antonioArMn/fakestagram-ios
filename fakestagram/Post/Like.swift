//
//  Like.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 5/2/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct Like: Codable {
    let author: Author?
    let createdAt: String
    let updatedAt: String
}
