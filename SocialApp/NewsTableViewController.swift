//
//  NewsTableViewController.swift
//  SocialApp
//
//  Created by Anna on 12.05.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news: [News] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        news = [
            News(name: "Пропавшая 20 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -300000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 2, comments: 5, shares: 56, views: 114),
            News(name: "Пропавшая 10 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -400000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 21, comments: 15, shares: 526, views: 1214),
            News(name: "Пропавшая 210 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -500000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 32, comments: 53, shares: 356, views: 1134),
            News(name: "Пропавшая 40 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -600000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 2, comments: 5, shares: 56, views: 114),
            News(name: "Пропавшая 70 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -700000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 2, comments: 5, shares: 56, views: 114),
            News(name: "Пропавшая 120 лет назад кошка вернулась к хозяйке", date: Date(timeIntervalSinceNow: -800000), text: "Чеширская кошка, пропавшая без вести 20 лет назад, вернулась к хозяйке. Об этом 12 марта сообщил британский портал Metro.\n\nПо его данным, Фиби нашли в семи милях от дома, на тот момент животному было 22 года. Кошка пропала из дома Кристин Болл в Нантуиче в 2001 году. После пропажи женщина расклеивала листовки с изображением кошки по окрестностям и тщетно стучалась в двери соседей.", photos: [UIImage(named: "NGCAT")!, UIImage(named: "group1")!, UIImage(named: "3kota")!, UIImage(named: "group2")!], likes: 2, comments: 5, shares: 56, views: 114),
        ]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath)

        if let cell = cell as? NewsTableViewCell {
            let newsArticle = news[indexPath.row]
            
            cell.configure(news: newsArticle)
        }

        return cell
    }

}
