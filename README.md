#  Retrieving Roots from Words

Stem Words is an iOS application that takes a user's input and removes or replaces matching suffixes from the user's input and returns the root of the words. The user is displayed a list of the root words found and keeps a running count of repeat roots. 

## Version

1.0

## Build and Runtime Requirements

Xcode 11.4 or later
iOS 13.4 or later

## Setup and Run 

### Cloning Repository

1. From repository, click Clone or download.
2. Under "Clone with HTTPS", click copy to clipboard
3. Open Terminal
4. Change your current working directory to the location where you want the cloned directory made
5. Type `git clone` followed by the URL you copied in the second step
    `$ git clone https://github.com/floresv26/StemWords.git`
6. Repository is now cloned

### Running the Project

1. Open up the project from the directory you cloned it to
2. Once you have the project open in Xcode, select an iPhone or iPad device and run the project
3. Once the project is running, insert text in the text field to find the root words. Below are the list of suffixes from the grammar rules. 

These are common suffixes in the language that can be removed to find the root word
    - 'L'
    - 'LZ'
    - 'EVM'
    - 'ZQ'
    
These suffixes require adding back letters to determine the root word
    - remove 'PZ' add 'A'
    - remove 'PZL' add 'AZ'
    - remove 'EZL' add 'R'
    
Example words to try
    - MZV
    - EV
    - KMZ
    - IHFULZ
    - HA
    - DUNEZL
    - MFNDV
    - ZPZVKL
    - EK
    - XZIHNZL
    - VZIZLLDUR
    - UZCUZLZVKDKEPZL
    - AHU
    - HVZ
    - CZHCSZ
    - QELLHSPZ
    - KMZ
    - CHSEKEIDS
    - XDVQL
    - JMEIM
    - KMZNLZSPZL

## Implementation

### View

Stem Words is a single view application. The view contains a textField to receive input from the user and provides the option to submit input via a "Find Root" button or the primary action of the textField. Submition of user input is only allowed when non whitespace text is inserted. The tableView and "Clear Roots" button are only visible once a root word has been extracted. When user taps "Clear Roots" button, the tableView is once again hidden.

### Presenter

The presenter receives a string of characters and separates multiple words. The words are cleaned up to remove any non alphabetic characters the user may have added.

Each words is then compared against a list of possible matching suffixes. There are suffixes that are removable to get the root word and suffixes that are replaceable to get the root word. In order to get the most accurate matching of suffixes, the removeable and replaceable suffixes are combined and sorted by suffix length to avoid matching, for example, "FGUHEZL" to "-L" before geting the chance to match against the more accurate "-EZL". For simplicity, once words are cleaned up, they are uppercased for comparisons and consistency of displaying results back to the user.

If the word contains a matching suffix, the suffix is compared to match a removable suffix or a replaceable suffix. If the word's suffix matches a removable suffix, the suffix is removed to obtain the root word. If the word's suffix matches a replaceable suffix, the suffix is replaced with it's corresponding replacement characters and returns the root word. If the word does not contain any of the possible suffixes from the grammar rules, then the words is simply added to the list of stem words. Each root words are compared to a dictionary of stem words to keep a running count of times of occurance.

## Application Architecture

This project uses the Model View Presenter (MVP) architecture. MVP allows for cleaner testing of the business logic compared to MVC and keeps a separation of responsibilities from the view and the business logic. The view controller contains a presenter property that communications the data for the tableView. Any user input and/or actions is communicated back to the presenter via the presenter's delegate protocol.

## TODOs

Testing of the view needs to be added. Additionally, a way of persisting the data the user has could be added, perhaps using Core Data for this simple project or something like a Realm database.

