var HDWalletProvider = require("truffle-hdwallet-provider");

// A testnet account with 10 ethers for you guys
var mnemonic = "magnet honey jealous police skill ball quality unaware approve diagram soon culture";

module.exports = {
  networks: {
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/ugOOyngpKVuHrN12o9MT",0)
      },
      network_id: 4
    }   
  }
};