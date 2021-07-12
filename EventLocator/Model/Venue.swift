//
//  Venue.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/10/21.
//

import Foundation

struct Venue : Codable {
	let state : String?
	let name_v2 : String?
	let postal_code : String?
	let name : String?
	let links : [String]?
	let timezone : String?
	let url : String?
	let score : Double?
	let location : Location?
	let address : String?
	let country : String?
	let has_upcoming_events : Bool?
	let num_upcoming_events : Int?
	let city : String?
	let slug : String?
	let extended_address : String?
	let id : Int?
	let popularity : Int?
//	let access_method : String?
	let metro_code : Int?
	let capacity : Int?
	let display_location : String?
}
