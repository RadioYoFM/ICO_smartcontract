# Radio Yo Token

This repository contains the token smart contract for RAO token from RadioYo.  RadioYo is a platform for people to livestream free online radio shows and broadcast prerecorded podcast episodes.  The URL is https://radioyo.fm.  We plan to add podcaster ownership information directly onto the blockchain while upgrading our platform into a blockchain-based broadcasting and services platform for podcasters, online broadcasters, independent media, and online publishers worldwide.  Our ICO website can be found at https://rao.radioyo.fm

## HOW TO

```
npm install -g truffle

npm install

```

+ Compile the code

```
truffle compile
```

+ We have added a test account and a `hdwalletProvider` to connect to `rinkeby` using infura. So you can just call

```
truffle migrate --network rinkeby
```

This will deploy the code on testnet.

NOTE - Do not use this method for deploying on mainnet as in testing it burnt 0.4 ETH for 
first migration. So save your money by deploying using Remix or a custom deployer.
