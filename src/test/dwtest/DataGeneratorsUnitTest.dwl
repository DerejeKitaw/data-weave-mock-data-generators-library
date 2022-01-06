
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
import * from org::mule::weave::generators::DataGenerators
import * from org::mule::weave::generators::constants::DataConstants
---
"Mock Data Generators" describedBy [
    "randomAge - Number format" in do {
    var base: Number = 5
    ---
            randomAge(base).asNumber must [
                beGreaterThan(base)
            ]
        },
    "randomAge - String format" in do {
            randomAge(5).asString must [
                $ matches /[0-9]{1,2}/
            ]
        },
    "randomRate - String format" in do {
            randomRate() must [
                $ matches /[0-1]{0,1}[0-9]{0,1}[0-9]%/
            ]
        },
    "randomUrl - URL format" in do{
            randomUrl() must [
                $ matches (/http:\/\/acme\.com\/[0-9]{0,7}/)
            ]
        },
    "randomPhoneNumber - String Format" in do {
            randomPhoneNumber() must [
                $ matches /[1-8]{1}[0-8]{1}[0-8]{1}-[0-9]{3}-[0-9]{4}/
             ]
        },
    "randomZipCode - String format" in do {
            randomZipCode().asString must [
                $ matches /[1-2]{1}[0-9]{4}/
            ]
        },
   "randomZipCode - Number format" in do {
            randomZipCode().asNumber must [
                beGreaterThan(10000),
                beLowerThan(20000)
            ]
        },
   "randomAddress - String format" in do {
            randomAddress() must [
                $ matches /([0-9]{1,5})(\s(\w*)){1,3}/
            ]
        },
    "randomCreditCardNumber - String format" in do {
            randomCreditCardNumber().asString must [
                $ matches /[0-9]{14,19}/
            ]
        },
    "randomCreditCardNumber - Number format" in do {
            randomCreditCardNumber().asNumber must [
                beGreaterThan(3*pow(10,13)),
                beLowerThan(5*pow(10,17))
            ]
        },

    "randomSSN - String format" in do{
            randomSSN() must  [
                $ matches /[0-9]{3}-[0-9]{2}-[0-9]{4}/
            ]
    },
    "randomGender - String format" in do{
            randomGender() must [
                beOneOf(["male", "female"])
            ]
    },
    "randomCity - String format" in do{
            randomCity() must [
                beString(),
                beOneOf(CITY_NAMES)
            ]
    },
    "randomPrice - String format" in do{
            randomPrice(3, 100).asString must [
                beString(),
                $ matches /[0-9]{1,3}\.[0-9]{1,2}/
            ]

    },
    "randomPrice - Number format" in do {
            randomPrice(100).asNumber must [
                beNumber(),
                beGreaterThan(0),
                beLowerThan(100)
            ]
    },
    "randomId - String format" in do {
            randomId() must [
                beString(),
                $ matches /(\w){0,32}/
            ]
    },
    "randomFirstName - String format" in do{
            randomFirstName() must [
                beString(),
                beOneOf(FIRST_NAMES)
            ]
    },
    "randomLastName - String format" in do{
            randomLastName() must [
                beString(),
                beOneOf(LAST_NAMES)
            ]
    },
    "randomFullName - String format" in do{
            randomFullName() must [
                beString(),
                $ matches /(\w*)\s(\w*)/
            ]
    },
    "randomDescription - String format" in do{
    var len: Number = 100
    ---
            randomDescription(len) must [
                beString(),
                sizeOf($) <= len
            ]
    },
    "randomEmailAddress - String format" in do{
            randomEmailAddress() must [
                beString(),
                $ matches /([a-z]*)[0-9]{1,4}@([a-z0-9_-]*)\.([a-z0-9\_\-\.]*)/
            ]
    }

]
