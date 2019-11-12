import Foundation

/* champion json formed with:
 [
    {
        "key": "266",
        "name": "Aatrox",
    ...
    },
    ...
 ]
*/
/* champion-index json formed with:
[
   1,
   33,
   ...
]
*/

struct Champion: Codable {
    let key: String
    let name: String
}

let champsFilePath = Bundle.main.path(forResource: "champs", ofType: "json")
let selectedIndexesFilePath = Bundle.main.path(forResource: "selectedIndexes", ofType: "json")

let champsData = FileManager.default.contents(atPath: champsFilePath!)
let selectedIndexesData = FileManager.default.contents(atPath: selectedIndexesFilePath!)

let champs = try JSONDecoder().decode([Champion].self, from: champsData!)
let selectedIndexes = try JSONDecoder().decode([Int].self, from: selectedIndexesData!)

// TODO: selectedIndexes는 챔피언 목록(champs)의 key 번호 들이다. selectedIndexes에 명시된 순서대로 챔피언들의 이름(name)을 나열하라
let names: [String] = selectedIndexes.compactMap { index in
    champs.first { $0.key == "\(index)" }?.name
}
print(names)

