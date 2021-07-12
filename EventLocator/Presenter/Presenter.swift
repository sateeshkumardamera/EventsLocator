//
//  EventParser.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/12/21.
//

import Foundation
import UIKit

protocol View: AnyObject {
    func setEvents(with object:[Event]) -> Void;
    func setImageForRow(at: IndexPath, image:UIImage) -> Void;
}

final class Presenter {
    
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!

    private weak var view:View?

    public init(view: View){
        self.view = view
        
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()

    }
    
    func getImageForRow(indexPath:IndexPath, imagePath: String) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                self.view?.setImageForRow(at: indexPath, image: image)
            }
        } else {
            /* We need placeholder image in your assets,
               if we want to display a placeholder to user */
            let placeholder = UIImage.init(named: "placeholder.png")
            DispatchQueue.main.async {
                self.view?.setImageForRow(at: indexPath, image: placeholder!)
            }
            let url: URL! = URL(string: imagePath)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        self.view?.setImageForRow(at: indexPath, image: img)
                    }
                }
            })
            task.resume()
        }
    }

    func getEvents() {
        var events = [Event]()
        
        let api = URL(string: "https://api.seatgeek.com/2/events?aid=123")
        URLSession.shared.dataTask(with: api!) { data , response, err in
            if(err != nil){
                print(err.debugDescription)
                return
            }else{
                do{
                    let result: RootModel = try JSONDecoder().decode(RootModel.self, from: data!)
                    events = result.events!
                    DispatchQueue.main.async {
                        self.view?.setEvents(with: events)
                    }
                    print(result)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
}
