//
//  EventDetailsViewController.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/12/21.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
class EventDetailsViewController: UIViewController {

    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet var eventImage: UIImageView!
    
    var event:Event? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedEvent = self.event{
            eventTitle.text = selectedEvent.title
            eventDate.text = selectedEvent.getLocalDate()
            eventLocation.text = selectedEvent.venue?.display_location
            if let imagePath = selectedEvent.performers?[0].image{
                eventImage.load(url: URL.init(string: imagePath)!)
            }

        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = "Details"
        navigationController?.navigationBar.barTintColor = UIColor(red: 33/255.0, green: 46/255.0, blue: 59/255.0, alpha: 1.0)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
