# Bitcoin Wallet App
![simulator_screenshot_21CCDB7B-E7ED-4EE7-9044-AF91AE54EF7A](https://github.com/Muazzam9/BitcoinWallet-iOS/assets/58729460/f9c9130f-19d9-435a-8a59-af1f21066094)

Welcome to the **Bitcoin Wallet App**! This is a simple iOS application built using Swift and SwiftUI that helps you keep track of your Bitcoin investments and their value in different currencies.

## Features

- Input the amount of Bitcoin you own.
- View the value of your Bitcoin in various currencies including BTC, ZAR, USD, and AUD.
- Visual indication of whether your asset value increased or decreased since yesterday.
- Refresh the data to get the latest updates.

## Getting Started

To run the app on your local machine, follow these steps:

1. Clone this repository to your local machine.
2. Open the project in Xcode.
3. Follow the API Key Setup first below.
4. Build and run the project on the iOS simulator or a physical device.

## Usage

1. Launch the app.
2. Enter the amount of Bitcoin you own in the provided text field.
3. Scroll down to view the value of your Bitcoin in different currencies.
4. The fluctuation percentage next to each currency indicates whether the value increased (green) or decreased (red) since yesterday.
5. Tap the refresh button at the bottom to update the data and get the latest values.

## Dependencies

The app uses the following technologies and libraries:

- Swift
- SwiftUI
- Fixer API for fetching currency exchange rates and fluctuations.

## API Key Setup

To use the Fixer API, you need to set up your API key:

1. Sign up for an account on the Fixer API website.
2. Obtain your API key from your account dashboard.
3. Set your API key as an environment variable in the config file named `FIXER_API_KEY` in Xcode.

## Debug vs. Release Methods
In your ViewModel class, you have a refreshData() method that fetches data from the API. Depending on whether you're building in a debug or release configuration, this method will use either real data from the API or dummy data.

### Debug Configuration:
In the debug configuration, you fetch dummy data. This is helpful during development and testing when you want to avoid using up your API call limit.

### Release Configuration:
In the release configuration, you fetch real data from the API. This is what you would use when you're deploying your app for actual use.

### Setting the Schema in Xcode
To switch between debug and release configurations, you can set the schema in Xcode as follows:

Debug Configuration:

Select the scheme dropdown near the top left of the Xcode window.
Choose "Edit Scheme..."
In the left sidebar, select "Run" under the "Info" tab.
In the "Build Configuration" dropdown, select "Debug".

Release Configuration:

Follow the same steps as above, but in the "Build Configuration" dropdown, select "Release".
By switching the scheme between debug and release, you can control whether your app uses real API data or dummy data while building and testing.

## Known Issues

- Limited API calls per day due to the basic version of the API.

## Future Enhancements

- Improved UI design and styling.
- Additional currencies for conversion.
- Better error handling for API calls and user inputs.

## Credits

This app is created by Mu'azzam Aziz.
