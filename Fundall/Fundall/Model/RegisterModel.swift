//
//  RegisterModel.swift
//  Fundall
//
//  Created by apple on 20/06/2021.
//

import Foundation

struct RegisterModel: Encodable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
    let password_confirmation: String
}
