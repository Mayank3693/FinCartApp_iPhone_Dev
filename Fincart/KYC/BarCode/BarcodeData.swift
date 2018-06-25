class BarcodeData {
    var name: String
    var house: String
    var street: String
    var vtc: String
    var po: String
    var dist: String
    var subdist: String
    var state: String
    var pc: String
    var dob: String
    var loc: String

    init?(dictionary: [String : String]) {
            let name = dictionary["name"]
            let house = dictionary["house"]
            let street = dictionary["street"]
            let vtc = dictionary["vtc"]
            let po = dictionary["po"]
            let dist = dictionary["dist"]
            let subdist = dictionary["subdist"]
            let state = dictionary["state"]
            let pc = dictionary["pc"]
            let dob = dictionary["dob"]
            let loc = dictionary["loc"]

        self.name = ""
        if name != nil {
            self.name = name!
        }
        self.house = ""
        if house != nil {
            self.house = house!
        }
        self.street = ""
        if street != nil {
            self.street = street!
        }
        self.vtc = ""
        if vtc != nil {
            self.vtc = vtc!
        }
        self.po = ""
        if po != nil {
            self.po = po!
        }
        self.dist = ""
        if dist != nil {
            self.dist = dist!
        }
        self.subdist = ""
        if subdist != nil {
            self.subdist = subdist!
        }
        self.state = ""
        if state != nil {
            self.state = state!
        }
        self.pc = ""
        if pc != nil {
            self.pc = pc!
        }
        self.dob = ""
        if dob != nil {
            self.dob = dob!
        }
        self.loc = ""
        if loc != nil {
            self.loc = loc!
        }
    }
}

class MyParser: NSObject {
    var parser: XMLParser
    
    var barcodes = [BarcodeData]()
    
    init(xml: String) {
        parser = XMLParser(data: xml.data(using: String.Encoding.utf8)!)
        super.init()
        parser.delegate = self
    }
    
    func parseXML() -> [BarcodeData] {
        parser.parse()
        return barcodes
    }
    
}

extension MyParser: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == "PrintLetterBarcodeData" {
            if let barcode = BarcodeData(dictionary: attributeDict) {
                barcodes.append(barcode)
            }
        }
    }
}
