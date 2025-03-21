import Foundation


//Registration model, which is used to store the information from the registrationview.
struct Registration: Identifiable{
    
    let id: UUID
    var personalData: PersonalData
    var address: Address
    var enrollment: Enrollment
    
    init(id: UUID = UUID(), personalData: PersonalData, address: Address, enrollment: Enrollment) {
        self.id = id
        self.personalData = personalData
        self.address = address
        self.enrollment = enrollment
    }
    
}

struct PersonalData {
    var first_name: String
    var last_name: String
    var gender: String
    var nationality: String
    var date_of_birth: Date
    var native_lanuage: String
}

struct Address {
    var country_of_citizenship: String
    var street_and_number: String
    var country: String
    var zipCode: String
    var city: String
}

struct Enrollment{
    var semester: String
    var department: String
    var degree: String
}


extension Registration {
    struct Data {
        var personalData: PersonalData = PersonalData(first_name: "", last_name: "", gender: "", nationality: "", date_of_birth: Date(timeIntervalSince1970: 0), native_lanuage: "")
        var address: Address = Address(country_of_citizenship: "", street_and_number: "", country: "", zipCode: "", city: "")
        var enrollment: Enrollment = Enrollment(semester: "", department: "", degree: "")
    }
    
    var data: Data {
        Data(personalData: personalData, address: address, enrollment: enrollment)
    }
    
    mutating func update(from data: Data){
        personalData = data.personalData
        address = data.address
        enrollment = data.enrollment
    }
}

struct CountryModel: Identifiable {
    let id = UUID()
    let parent: String
    let children: [String]
}

extension Registration{
    
    
    static let sampleRegistration : Registration =
    Registration(personalData: PersonalData(first_name: "", last_name: "", gender: "", nationality: "", date_of_birth: Date(timeIntervalSince1970: 0), native_lanuage: ""), address: Address(country_of_citizenship: "", street_and_number: "", country: "", zipCode: "", city: ""), enrollment: Enrollment(semester: "", department: "", degree: ""))
    
    
    static let genders: [String] = ["Male", "Female", "Other"]
    
    static let degrees: [String] = ["Bachelor", "Master"]
    
    static let semester: [String] = ["Spring Semester 2022", "Autumn Semester 2022", "Spring Semester 2023", "Autumn Semester 2023"]
    
    static let departments: [String] =
    ["Architecture", "Biology", "Chemistry", "Computer Science", "Data Science", "Earth Science", "Health Science", "Mathematics", "Medicine", "Physics" ]
    
    static let languages: [String] = [
        "Mandarin Chinese",
        "Spanish",
        "English",
        "Hindi/Urdu",
        "Arabic",
        "Bengali",
        "Portuguese",
        "Russian",
        "Japanese",
        "German",
        "Javanese",
        "Punjabi",
        "Wu",
        "French",
        "Telugu",
        "Vietnamese",
        "Marathi",
        "Korean",
        "Tamil",
        "Italian",
        "Turkish",
        "Other"
    ]
    
    
    static let countries: [String] = ["Afghanistan",
                                      "Albania",
                                      "Algeria",
                                      "American Samoa",
                                      "Andorra",
                                      "Angola",
                                      "Anguilla",
                                      "Antarctica",
                                      "Antigua and Barbuda",
                                      "Argentina",
                                      "Armenia",
                                      "Aruba",
                                      "Australia",
                                      "Austria",
                                      "Azerbaijan",
                                      "Bahamas (the)",
                                      "Bahrain",
                                      "Bangladesh",
                                      "Barbados",
                                      "Belarus",
                                      "Belgium",
                                      "Belize",
                                      "Benin",
                                      "Bermuda",
                                      "Bhutan",
                                      "Bolivia (Plurinational State of)",
                                      "Bonaire, Sint Eustatius and Saba",
                                      "Bosnia and Herzegovina",
                                      "Botswana",
                                      "Bouvet Island",
                                      "Brazil",
                                      "British Indian Ocean Territory (the)",
                                      "Brunei Darussalam",
                                      "Bulgaria",
                                      "Burkina Faso",
                                      "Burundi",
                                      "Cabo Verde",
                                      "Cambodia",
                                      "Cameroon",
                                      "Canada",
                                      "Cayman Islands (the)",
                                      "Central African Republic (the)",
                                      "Chad",
                                      "Chile",
                                      "China",
                                      "Christmas Island",
                                      "Cocos (Keeling) Islands (the)",
                                      "Colombia",
                                      "Comoros (the)",
                                      "Congo (the Democratic Republic of the)",
                                      "Congo (the)",
                                      "Cook Islands (the)",
                                      "Costa Rica",
                                      "Croatia",
                                      "Cuba",
                                      "Curaçao",
                                      "Cyprus",
                                      "Czechia",
                                      "Côte d'Ivoire",
                                      "Denmark",
                                      "Djibouti",
                                      "Dominica",
                                      "Dominican Republic (the)",
                                      "Ecuador",
                                      "Egypt",
                                      "El Salvador",
                                      "Equatorial Guinea",
                                      "Eritrea",
                                      "Estonia",
                                      "Eswatini",
                                      "Ethiopia",
                                      "Falkland Islands (the) [Malvinas]",
                                      "Faroe Islands (the)",
                                      "Fiji",
                                      "Finland",
                                      "France",
                                      "French Guiana",
                                      "French Polynesia",
                                      "French Southern Territories (the)",
                                      "Gabon",
                                      "Gambia (the)",
                                      "Georgia",
                                      "Germany",
                                      "Ghana",
                                      "Gibraltar",
                                      "Greece",
                                      "Greenland",
                                      "Grenada",
                                      "Guadeloupe",
                                      "Guam",
                                      "Guatemala",
                                      "Guernsey",
                                      "Guinea",
                                      "Guinea-Bissau",
                                      "Guyana",
                                      "Haiti",
                                      "Heard Island and McDonald Islands",
                                      "Holy See (the)",
                                      "Honduras",
                                      "Hong Kong",
                                      "Hungary",
                                      "Iceland",
                                      "India",
                                      "Indonesia",
                                      "Iran (Islamic Republic of)",
                                      "Iraq",
                                      "Ireland",
                                      "Isle of Man",
                                      "Israel",
                                      "Italy",
                                      "Jamaica",
                                      "Japan",
                                      "Jersey",
                                      "Jordan",
                                      "Kazakhstan",
                                      "Kenya",
                                      "Kiribati",
                                      "Korea (the Democratic People's Republic of)",
                                      "Korea (the Republic of)",
                                      "Kuwait",
                                      "Kyrgyzstan",
                                      "Lao People's Democratic Republic (the)",
                                      "Latvia",
                                      "Lebanon",
                                      "Lesotho",
                                      "Liberia",
                                      "Libya",
                                      "Liechtenstein",
                                      "Lithuania",
                                      "Luxembourg",
                                      "Macao",
                                      "Madagascar",
                                      "Malawi",
                                      "Malaysia",
                                      "Maldives",
                                      "Mali",
                                      "Malta",
                                      "Marshall Islands (the)",
                                      "Martinique",
                                      "Mauritania",
                                      "Mauritius",
                                      "Mayotte",
                                      "Mexico",
                                      "Micronesia (Federated States of)",
                                      "Moldova (the Republic of)",
                                      "Monaco",
                                      "Mongolia",
                                      "Montenegro",
                                      "Montserrat",
                                      "Morocco",
                                      "Mozambique",
                                      "Myanmar",
                                      "Namibia",
                                      "Nauru",
                                      "Nepal",
                                      "Netherlands (the)",
                                      "New Caledonia",
                                      "New Zealand",
                                      "Nicaragua",
                                      "Niger (the)",
                                      "Nigeria",
                                      "Niue",
                                      "Norfolk Island",
                                      "Northern Mariana Islands (the)",
                                      "Norway",
                                      "Oman",
                                      "Pakistan",
                                      "Palau",
                                      "Palestine, State of",
                                      "Panama",
                                      "Papua New Guinea",
                                      "Paraguay",
                                      "Peru",
                                      "Philippines (the)",
                                      "Pitcairn",
                                      "Poland",
                                      "Portugal",
                                      "Puerto Rico",
                                      "Qatar",
                                      "Republic of North Macedonia",
                                      "Romania",
                                      "Russian Federation (the)",
                                      "Rwanda",
                                      "Réunion",
                                      "Saint Barthélemy",
                                      "Saint Helena, Ascension and Tristan da Cunha",
                                      "Saint Kitts and Nevis",
                                      "Saint Lucia",
                                      "Saint Martin (French part)",
                                      "Saint Pierre and Miquelon",
                                      "Saint Vincent and the Grenadines",
                                      "Samoa",
                                      "San Marino",
                                      "Sao Tome and Principe",
                                      "Saudi Arabia",
                                      "Senegal",
                                      "Serbia",
                                      "Seychelles",
                                      "Sierra Leone",
                                      "Singapore",
                                      "Sint Maarten (Dutch part)",
                                      "Slovakia",
                                      "Slovenia",
                                      "Solomon Islands",
                                      "Somalia",
                                      "South Africa",
                                      "South Georgia and the South Sandwich Islands",
                                      "South Sudan",
                                      "Spain",
                                      "Sri Lanka",
                                      "Sudan (the)",
                                      "Suriname",
                                      "Svalbard and Jan Mayen",
                                      "Sweden",
                                      "Switzerland",
                                      "Syrian Arab Republic",
                                      "Taiwan",
                                      "Tajikistan",
                                      "Tanzania, United Republic of",
                                      "Thailand",
                                      "Timor-Leste",
                                      "Togo",
                                      "Tokelau",
                                      "Tonga",
                                      "Trinidad and Tobago",
                                      "Tunisia",
                                      "Turkey",
                                      "Turkmenistan",
                                      "Turks and Caicos Islands (the)",
                                      "Tuvalu",
                                      "Uganda",
                                      "Ukraine",
                                      "United Arab Emirates (the)",
                                      "United Kingdom of Great Britain and Northern Ireland (the)",
                                      "United States Minor Outlying Islands (the)",
                                      "United States of America (the)",
                                      "Uruguay",
                                      "Uzbekistan",
                                      "Vanuatu",
                                      "Venezuela (Bolivarian Republic of)",
                                      "Viet Nam",
                                      "Virgin Islands (British)",
                                      "Virgin Islands (U.S.)",
                                      "Wallis and Futuna",
                                      "Western Sahara",
                                      "Yemen",
                                      "Zambia",
                                      "Zimbabwe"]
}


