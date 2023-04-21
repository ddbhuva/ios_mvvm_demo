//
//  ListDataModel.swift
//  MVVMSampleDemo
//
//  Created by Kevin on 28/11/22.
//

import Foundation
import UIKit

struct ListDataModel : Codable {
    
    let data : [ListData]?
    let message : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        data = try? values?.decodeIfPresent([ListData].self, forKey: .data)
        message = try? values?.decodeIfPresent(String.self, forKey: .message)
        status = try? values?.decodeIfPresent(String.self, forKey: .status)
    }
    
}

struct ListData : Codable {

    let id : Int?
    let imagePath : String?
    let title : String?
    let categoryId : Int?
    let description : String?
    let facebookUrl : String?
    let instagramUrl : String?
    let videoUrl : String?
    let url : String?
    let address : String?
    let latitude : String?
    let longitude : String?
    let phone : String?
    let resourceStatus : String?
    let orderNum : Int?
    let deletedAt : String?
    let createdAt : String?
    let updatedAt : String?
    let categoryName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case imagePath = "image_path"
        case title = "title"
        case categoryId = "category_id"
        case description = "description"
        case facebookUrl = "facebook_url"
        case instagramUrl = "instagram_url"
        case videoUrl = "video_url"
        case url = "url"
        case address = "address"
        case latitude = "latitude"
        case longitude = "longitude"
        case phone = "phone"
        case resourceStatus = "resource_status"
        case orderNum = "order_num"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case categoryName = "category_name"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? values?.decodeIfPresent(Int.self, forKey: .id)
        imagePath = try? values?.decodeIfPresent(String.self, forKey: .imagePath)
        title = try? values?.decodeIfPresent(String.self, forKey: .title)
        categoryId = try? values?.decodeIfPresent(Int.self, forKey: .categoryId)
        description = try? values?.decodeIfPresent(String.self, forKey: .description)
        facebookUrl = try? values?.decodeIfPresent(String.self, forKey: .facebookUrl)
        instagramUrl = try? values?.decodeIfPresent(String.self, forKey: .instagramUrl)
        videoUrl = try? values?.decodeIfPresent(String.self, forKey: .videoUrl)
        url = try? values?.decodeIfPresent(String.self, forKey: .url)
        address = try? values?.decodeIfPresent(String.self, forKey: .address)
        latitude = try? values?.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try? values?.decodeIfPresent(String.self, forKey: .longitude)
        phone = try? values?.decodeIfPresent(String.self, forKey: .phone)
        resourceStatus = try? values?.decodeIfPresent(String.self, forKey: .resourceStatus)
        orderNum = try? values?.decodeIfPresent(Int.self, forKey: .orderNum)
        deletedAt = try? values?.decodeIfPresent(String.self, forKey: .deletedAt)
        createdAt = try? values?.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try? values?.decodeIfPresent(String.self, forKey: .updatedAt)
        categoryName = try? values?.decodeIfPresent(String.self, forKey: .categoryName)
        
    }
}
