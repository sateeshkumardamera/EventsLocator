//
//  PerformerImages.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/12/21.
//

import Foundation

struct Images : Codable {
	let the1200x525 : String?
	let the1200x627 : String?
	let the136x136 : String?
	let the500_700 : String?
	let the800x320 : String?
	let banner : String?
	let block : String?
	let criteo_130_160 : String?
	let criteo_170_235 : String?
	let criteo_205_100 : String?
	let criteo_400_300 : String?
	let fb_100x72 : String?
	let fb_600_315 : String?
	let huge : String?
	let ipad_event_modal : String?
	let ipad_header : String?
	let ipad_mini_explore : String?
	let mongo : String?
	let square_mid : String?
	let triggit_fb_ad : String?

	enum CodingKeys: String, CodingKey {

		case the1200x525 = "1200x525"
		case the1200x627 = "1200x627"
		case the136x136 = "136x136"
		case the500_700 = "500_700"
		case the800x320 = "800x320"
		case banner = "banner"
		case block = "block"
		case criteo_130_160 = "criteo_130_160"
		case criteo_170_235 = "criteo_170_235"
		case criteo_205_100 = "criteo_205_100"
		case criteo_400_300 = "criteo_400_300"
		case fb_100x72 = "fb_100x72"
		case fb_600_315 = "fb_600_315"
		case huge = "huge"
		case ipad_event_modal = "ipad_event_modal"
		case ipad_header = "ipad_header"
		case ipad_mini_explore = "ipad_mini_explore"
		case mongo = "mongo"
		case square_mid = "square_mid"
		case triggit_fb_ad = "triggit_fb_ad"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        the1200x525 = try values.decodeIfPresent(String.self, forKey: .the1200x525)
        the1200x627 = try values.decodeIfPresent(String.self, forKey: .the1200x627)
        the136x136 = try values.decodeIfPresent(String.self, forKey: .the136x136)
        the500_700 = try values.decodeIfPresent(String.self, forKey: .the500_700)
        the800x320 = try values.decodeIfPresent(String.self, forKey: .the800x320)
		banner = try values.decodeIfPresent(String.self, forKey: .banner)
		block = try values.decodeIfPresent(String.self, forKey: .block)
		criteo_130_160 = try values.decodeIfPresent(String.self, forKey: .criteo_130_160)
		criteo_170_235 = try values.decodeIfPresent(String.self, forKey: .criteo_170_235)
		criteo_205_100 = try values.decodeIfPresent(String.self, forKey: .criteo_205_100)
		criteo_400_300 = try values.decodeIfPresent(String.self, forKey: .criteo_400_300)
		fb_100x72 = try values.decodeIfPresent(String.self, forKey: .fb_100x72)
		fb_600_315 = try values.decodeIfPresent(String.self, forKey: .fb_600_315)
		huge = try values.decodeIfPresent(String.self, forKey: .huge)
		ipad_event_modal = try values.decodeIfPresent(String.self, forKey: .ipad_event_modal)
		ipad_header = try values.decodeIfPresent(String.self, forKey: .ipad_header)
		ipad_mini_explore = try values.decodeIfPresent(String.self, forKey: .ipad_mini_explore)
		mongo = try values.decodeIfPresent(String.self, forKey: .mongo)
		square_mid = try values.decodeIfPresent(String.self, forKey: .square_mid)
		triggit_fb_ad = try values.decodeIfPresent(String.self, forKey: .triggit_fb_ad)
	}

}
