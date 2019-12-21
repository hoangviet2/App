//
//  UserInfo.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 8/5/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import Foundation

struct UserApi: Codable {
    let status: String?
    let code: Int?
    let messager: String?
    var data: UserData?
}

struct UserData: Codable {
    var access_token: String?
    var token_type: String?
    var refresh_token: String?
    var user: UserInfo?
}

struct  UserInfo: Codable {
    var uid: String?
    var token: String?
    var name: String?
    var email: String?
    var is_verify_email: Bool?
    var phone: String?
    var gender: String?
    var avatar_url: String?
    var address: String?
    var birthday: String?
    var updated_at: String?
    var created_at: String?
}
struct  UserInfoData: Codable {
    var uid: String?
    var id: Int?
    var is_active: Bool?
    var is_verify_email: Bool?
    var gender: Gender?
    var address: Address?
    var wallet: Int?
    var reward_wallet: Int?
    var company: String?
    var about_company: String?
    var social_id: String?
    var social_type: String?
    var rating: Double?
    var talent: Double?
    var role_id: Int?
    var avatar: Avatar?
    var location: String?
    var created_at: String?
    var updated_at: String?
}
struct Avatar : Codable {
    var id: Int?
    var avatar_url: String?
    var imageable_type: String?
    var imageable_id: Int?
    var name: String?
    var created_at: String?
    var updated_at: String?
}
struct Gender: Codable {
    var id: Int?
    var name: String?
    var gender_url: String?
}
struct Address: Codable {
    var address_more: String?
    var address: String?
    var street: String?
    var post_office: Int?
    var ward: String?
    var ward_id: Int?
    var district: String?
    var district_id: Int?
    var province: String?
    var province_id: Int?
    var country: String?
    var country_id: Int?
    var latitude: Double?
    var longitude: Double?
}
