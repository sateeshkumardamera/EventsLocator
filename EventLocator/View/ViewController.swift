//
//  ViewController.swift
//  EventsList
//
//  Created by Sateesh Damera on 7/9/21.
//

import UIKit

// MARK: - View Impelementation

extension ViewController: View {
    func setEvents(with object: [Event]) {
        self.events = object
        self.eventsTable.reloadData()
    }
    func setImageForRow(at indexPath: IndexPath, image:UIImage) {
        if let updateCell = self.eventsTable.cellForRow(at: indexPath) as? EventTableViewCell {
            updateCell.eventImage.image = image
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let eventDetailsViewController = storyboard.instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        if !searchString.isEmpty{
            eventDetailsViewController.event = filteredEvents[indexPath.row]
        }else{
            eventDetailsViewController.event = events[indexPath.row]
        }
        
        self.navigationController?.pushViewController(eventDetailsViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchString.isEmpty{
            return filteredEvents.count
        }
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventTableViewCell
        if !searchString.isEmpty{
            cell.titile.text = filteredEvents[indexPath.row].title
            cell.eventDate.text = filteredEvents[indexPath.row].getLocalDate()
            cell.eventLocation.text = filteredEvents[indexPath.row].venue?.display_location
            if(filteredEvents[indexPath.row].isFavorite()){
                cell.favIcon.isHidden = false
            }else{
                cell.favIcon.isHidden = true
            }
            if let imagePath = filteredEvents[indexPath.row].performers?[0].image{
                presenter.getImageForRow(indexPath: indexPath, imagePath: imagePath)
            }

        }else{
            cell.titile.text = events[indexPath.row].title
            cell.eventDate.text = events[indexPath.row].getLocalDate()
            cell.eventLocation.text = events[indexPath.row].venue?.display_location
            if(events[indexPath.row].isFavorite()){
                cell.favIcon.isHidden = false
            }else{
                cell.favIcon.isHidden = true
            }
            if let imagePath = events[indexPath.row].performers?[0].image{
                presenter.getImageForRow(indexPath: indexPath, imagePath: imagePath)
            }

        }
        return cell
    }

}

extension ViewController: UISearchBarDelegate{
  
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchField.text = ""
        searchString = ""
        filteredEvents.removeAll()
        self.eventsTable.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchString = searchText
        if searchText.isEmpty{
            filteredEvents.removeAll()
            self.eventsTable.reloadData()
        }else{
            self.filterText(searchText)
        }
    }

}

class ViewController: UIViewController {
        
    func filterText(_ query: String)  {
        filteredEvents.removeAll()
        for event in events {
            if ((event.title?.contains(query)) == true){
                filteredEvents.append(event)
            }
        }
        self.eventsTable.reloadData()
    }
    @IBOutlet var eventsTable: UITableView!
    @IBOutlet var searchField: UISearchBar!
    
    var events = [Event]()
    var filteredEvents = [Event]()
    var searchString: String = ""
    
    private lazy var presenter: Presenter = {
        let temp = Presenter(view: self)
        return temp
    }()
    
    //let parser = EventParser()
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTable.delegate = self
        eventsTable.dataSource = self
        searchField.delegate = self
        
        searchField.backgroundColor = .clear
        searchField.searchTextField.backgroundColor = .black
        
        presenter.getEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.eventsTable.reloadData()
    }
}

