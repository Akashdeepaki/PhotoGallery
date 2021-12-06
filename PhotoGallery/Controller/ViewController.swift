//
//  ViewController.swift
//  PhotoGallery
//
//
//

import UIKit
var imageList = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]
var indexVal = 0
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var Photo_CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Photo_CollectionView.delegate = self
        Photo_CollectionView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCellCollectionViewCell", for: indexPath as IndexPath) as! PhotoCollectionCellCollectionViewCell
        let width = Photo_CollectionView.frame.width
        let cellWidth = width/3.18
        cell.ImageView.image = UIImage(named: imageList[indexPath.row])
        cell.CellWidth.constant = cellWidth
        cell.CellHeight.constant = cellWidth
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexVal = indexPath.row
        let imageInfo = GSImageInfo(image: UIImage(named: "\(imageList[indexVal])")!, imageMode: .aspectFit)
        let transactioInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transactioInfo)
        
        imageViewer.dismissCompletion = {
            print("Hello")
            indexVal = 0
        }
        present(imageViewer, animated: true, completion: nil)
    }
    

}

