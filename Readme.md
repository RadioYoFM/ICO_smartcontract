# Radio Yo Token

This repository contains the token contract for RAO token.

## HOW TO

```
npm install -g truffle

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
