//
//  Genres.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/12/21.
//

import Foundation
struct Genres : Codable {
	let id : Int?
	let name : String?
	let slug : String?
	let primary : Bool?
	let images : Images?
	let image : String?
	let document_source : DocumentSource?
}
