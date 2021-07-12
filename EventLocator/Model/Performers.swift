//
//  Performers.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/12/21.
//
import Foundation
struct Performers : Codable {
	let type : String?
	let name : String?
	let image : String?
	let id : Int?
	let images : Images?
	let divisions : String?
	let has_upcoming_events : Bool?
	let primary : Bool?
	let stats : Stats?
	let taxonomies : [Taxonomies]?
	let image_attribution : String?
	let url : String?
	let score : Double?
	let slug : String?
	let home_venue_id : Int?
	let short_name : String?
	let num_upcoming_events : Int?
//	let colors : String?
	let image_license : String?
	let genres : [Genres]?
	let popularity : Int?
//	let location : String?
}
