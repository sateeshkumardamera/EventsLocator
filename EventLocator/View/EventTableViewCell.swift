//
//  EventTableViewCell.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/11/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var titile: UILabel!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventLocation: UILabel!
    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var innerView: UIView!
    @IBOutlet var favIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.eventImage.image = nil
    }
    override func layoutSubviews() {
        // Set the width of the cell
        //self.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 40, height: self.bounds.size.height)
        // Make it card-like
        
        self.eventImage.layer.cornerRadius = 6
        self.eventImage.clipsToBounds = true

        self.innerView.layer.cornerRadius = 6
        self.innerView.clipsToBounds = true

        self.innerView.layer.shadowPath =
              UIBezierPath(roundedRect: self.innerView.bounds,
              cornerRadius: self.innerView.layer.cornerRadius).cgPath
        self.innerView.layer.shadowColor = UIColor.black.cgColor
        self.innerView.layer.shadowOpacity = 0.5
        self.innerView.layer.shadowOffset = .zero
        self.innerView.layer.shadowRadius = 4
        self.innerView.layer.masksToBounds = false

        self.eventImage.contentMode = ContentMode.scaleAspectFill

        super.layoutSubviews()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
