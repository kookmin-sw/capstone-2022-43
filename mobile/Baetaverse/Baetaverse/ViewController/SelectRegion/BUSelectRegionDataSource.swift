//
//  BUSelectRegionDataSource.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionDataSource: NSObject {
    
    private(set) var countries = [String: [(String, String)]]()
    
    private lazy var sections: [String] = {
        self.countries.keys.sorted(by: <).map({ String($0) })
    }()
    
    private(set) var selectedRegion = IndexPath(row: 0, section: 0)
    
    var currentRegion: String {
        let index = sections[selectedRegion.section]
        let code = countries[index]?[selectedRegion.row].0 ?? ""
        return code
    }
    
    
    
    func changeSelectedRegion(to indexPath: IndexPath) {
        self.selectedRegion = indexPath
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
        
        let index = sections[indexPath.section]
        let countryName = countries[index]?[indexPath.row].1 ?? ""
        
        var content = cell.defaultContentConfiguration()
        content.text = countryName
        cell.contentConfiguration = content
        
        if indexPath == selectedRegion {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
}
