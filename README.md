# Bitcoin Wallet App
![simulator_screenshot_CE5C1349-9D86-48F5-89D7-BF0BF3F2FDC8](https://github.com/Muazzam9/BitcoinWallet-iOS/assets/58729460/a072c2aa-9b50-4a32-b79b-457668e9c8e3)

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

## Known Issues

- Limited API calls per day due to the basic version of the API.

## Future Enhancements

- Improved UI design and styling.
- Additional currencies for conversion.
- Better error handling for API calls and user inputs.

## Credits

This app is created by Mu'azzam Aziz.
