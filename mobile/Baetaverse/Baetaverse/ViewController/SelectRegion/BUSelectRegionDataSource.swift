//
//  BUSelectRegionDataSource.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionDataSource: NSObject {
    
    private(set) var countries: [Character: [String]]
    private var sections: [Character]
    
    override init() {
        self.countries = [
            "China",
            "Japan",
            "South Korea",
            "United States"
        ].reduce([Character: [String]]()) { partialResult, countryName in
            guard let alphabetIndex = countryName.capitalized.first else {
                return partialResult
            }
            
            var dict = partialResult
            
            if let existValue = partialResult[alphabetIndex] {
                dict.updateValue(existValue + [countryName], forKey: alphabetIndex)
            } else {
                dict[alphabetIndex] = [countryName]
            }
            
            return dict
        }
        self.sections = countries.keys.sorted(by: <)
        super.init()
    }
    
}

extension BUSelectRegionDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = sections[section]
        return countries[index]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let index = sections[indexPath.section]
        content.text = countries[index]?[indexPath.row] ?? ""
        cell.contentConfiguration = content

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sections[section])
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { char in
            String(char)
        }
    }
    
}
