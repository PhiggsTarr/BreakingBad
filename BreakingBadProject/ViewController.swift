//
//  ViewController.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//



import UIKit

class ViewController: UITableViewController{
    
    //Creates a model array to populate with the ModelData elements once the network call is made
    var model: [ModelData] = []
    var detailViewController = DetailViewController()
    static var imageData = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Breaking Bad Characters"
        
        Task {
            //Uses the NetworkingLayer to make the network call and load the model array with the JSON elements
            model = await NetworkingLayer().loadData()
            self.tableView.reloadData()
        }
        
        //Sets the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.font: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Sets our tableView rows to the number of elements in our model array
        return model.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //Sets our tableview section to 1 section
        1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Checks to see if TableViewCell is nil and if nil immediately return a UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        //Continue function if tableviewCell is not nil
        
        //Sets Cell Data to be equal to the data of the index of the model array
        cell.data = model[indexPath.row]
       // print(model[indexPath.row].name, model[indexPath.row].img)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Sets the image for the row the user selected to be the imageData for the detail view
        ViewController.imageData = URL(string: model[indexPath.row].img)
        
    }
}

extension ViewController {
    //Sets height for tableView row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}


//Extension to load imageview
extension UIImageView {
    func load(url: URL, completion: @escaping () -> Void) async {
//       // DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                        completion()
//                    }
//                }
//            }
//        }
        let request = URLRequest(url: url)
        do {
            //Do try-catch to load data asynchronously and add elements to our results arry
            let (data, _) = try await URLSession.shared.data(for: request)
            print(data)
            if data.count == 0 {
                self.image = #imageLiteral(resourceName: "image-not-found.jpeg")
                completion()
                return
            }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                self.image = image
                completion()
            }
                
            }
            //If we come arcoss an error then print message in console
        } catch{
            
            print("Error")
        }
    }
    
    //Shows the loading indicator in case user scrolls to a picture before it fully loads
    var activityIndicator: UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }
}
