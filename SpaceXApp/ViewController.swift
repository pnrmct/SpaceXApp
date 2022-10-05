//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Pınar Macit on 5.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var model: [SpaceX]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        getSpaceX()
        collectionView.register(UINib(nibName: "RocketListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RocketListCell")
    }

    private func getSpaceX() {
        
        let url = URL(string: "https://api.spacexdata.com/v5/launches")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching ...: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            if let data = data,
               let spacemodel = try? JSONDecoder().decode([SpaceX].self, from: data) {
                self.model = spacemodel
            }
    })
    task.resume()
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketListCell", for: indexPath) as? RocketListCollectionViewCell
      cell?.configuration(result:(model?.results[indexPath.row])!)
        return cell!
    }
    
}


