//
//  EventBaseModel.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/10/21.
//
import Foundation

struct Event : Codable {
	let type : String?
	let id : Int?
	let datetime_utc : String?
	let venue : Venue?
	let datetime_tbd : Bool?
	let performers : [Performers]?
	let is_open : Bool?
	let links : [String]?
	let datetime_local : String?
	let time_tbd : Bool?
	let short_title : String?
	let visible_until_utc : String?
	let stats : Stats?
	let taxonomies : [Taxonomies]?
	let url : String?
	let score : Double?
	let announce_date : String?
	let created_at : String?
	let date_tbd : Bool?
	let title : String?
	let popularity : Double?
	let description : String?
	let status : String?
//	let access_method : String?
	let event_promotion : String?
	let announcements : Announcements?
	let conditional : Bool?
	let enddatetime_utc : String?
	let themes : [String]?
	let domain_information : [String]?
    
    func getLocalDate() -> String {
        
        guard let dateTimeString = datetime_local else {
            return ""
        }
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: dateTimeString)

        guard let dateTime = date else {
            return ""
        }
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "EEE, MMM d, yyyy h:mm a"
        let timeStamp = dateFormatter.string(from: dateTime)

        return timeStamp
    }
}
