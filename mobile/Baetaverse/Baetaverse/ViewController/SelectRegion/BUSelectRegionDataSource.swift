//
//  BUSelectRegionDataSource.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionDataSource: NSObject {
    
    private(set) var countries: [String: [(String, String)]]
    
    private lazy var sections: [String] = {
        self.countries.keys.sorted(by: <).map({ String($0) })
    }()
    
    private(set) var selectedRegion = IndexPath(row: 0, section: 0)
    
    var currentRegion: String {
        let index = sections[selectedRegion.section]
        let code = countries[index]?[selectedRegion.row].0 ?? ""
        return code
    }
    
    override init() {
        self.countries = Self.configure()
        super.init()
    }
    
    private static func configure() -> [String: [(String, String)]] {
        Locale.isoRegionCodes.reduce([String: [(String, String)]]()) { partialResult, countryCode in
            guard let localizedCountryName = Locale.current.localizedString(forRegionCode: countryCode) else {
                return partialResult
            }
            guard let countryIndex = localizedCountryName.capitalized.first else {
                return partialResult
            }
            
            var newResult = partialResult
            let index = String(countryIndex)
            let countryPair = (countryCode, localizedCountryName)
            
            if partialResult[index] == nil {
                newResult[index] = [countryPair]
            } else {
                newResult[index]?.append(contentsOf: [countryPair])
                newResult[index]?.sort(by: { first, second in
                    first.1 < second.1
                })
            }
            
            return newResult
        }
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
