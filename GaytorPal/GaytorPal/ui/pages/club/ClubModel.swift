//
//  ClubModel.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/31/24.
//

import Foundation
import SwiftUI


struct Club: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let fullName: String
    let description: String
    var categories: Set<String>
}

var clubs = [
    Club(name: "SHPE", imageName: "shpe", fullName: "Society of Hispanic Professional Engineers", description: "A national organization of professional engineers to serve as role models in the Hispanic community.", categories: ["Leadership", "Technology", "Engr."]),
    Club(name: "Student Gov", imageName: "studentGov", fullName: "Student Government", description: "The governing body representing students, responsible for advocating student interests and organizing campus-wide initiatives.", categories: ["Leadership, Politics"]),
    Club(name: "ACM", imageName: "acm", fullName: "Association for Computing Machinery", description: "The world's largest educational and scientific computing society, dedicated to advancing the arts, sciences, and applications of information technology.", categories: ["Technology", "Education"]),
    Club(name: "Color Stack", imageName: "colorStack", fullName: "Color Stack UF", description: "A community aimed at supporting underrepresented groups in technology, promoting diversity, and providing networking opportunities.", categories: ["Technology", "Diversity", "Engr." ]),
    Club(name: "Open Source", imageName: "openSource", fullName: "Open Source Club", description: "A club that promotes and contributes to open source projects, fostering an environment of collaboration and learning in software development.", categories: ["Technology", "Hobby", "Engr."])
]

