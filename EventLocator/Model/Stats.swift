//
//  Stats.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/10/21.
//
import Foundation
struct Stats : Codable {
	let listing_count : Int?
	let average_price : Double?
	let lowest_price_good_deals : Int?
	let lowest_price : Double?
	let highest_price : Double?
	let visible_listing_count : Int?
//	let dq_bucket_counts : Double?
	let median_price : Double?
	let lowest_sg_base_price : Double?
	let lowest_sg_base_price_good_deals : Int?
}
