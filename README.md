# Crypto Dashboard

<img alt="Crystal" src="https://img.shields.io/badge/Made%20with%20crystal-black?style=for-the-badge&logo=crystal"/>

Crypto Dashboard (or *crdash* for short) is a cryptocurrency status board right in your terminal. Using [messari.io](https://messari.io) API to fetch 
current crypto rates, *crdash* aims to make checking these rates comfortable and accessible, as you do not need to open your browser or another program.

## Installation

Crypto Dashboard can be installed by cloning this repo and building the binary with *crystal* or by downloading the binary from the releases page.

```
git clone https://github.com/Loupeznik/crypto-dashboard.git
crystal build crypto-dashboard/src/crypto-dashboard.cr -o crdash --release
```

## Usage

```
crdash --interval <interval> --coins=coin1,coin2
```

## Contributing

1. Fork it (<https://github.com/Loupeznik/crypto-dashboard/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Dominik Zarsky](https://github.com/Loupeznik) - creator and maintainer
