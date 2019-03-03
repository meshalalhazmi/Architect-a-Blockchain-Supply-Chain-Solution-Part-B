var HDWalletProvider = require('truffle-hdwallet-provider');
// var mnemonic = '#### #### ## ##### ###';
var mnemonic = 'gather account order iron runway open purpose sick short chair brain calm';


module.exports = {
  networks: {
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/1ee2aa47c46746e59cbbbcdebd87abde");
      },
      network_id: 4,
     
    },
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    }
    
    
  }
};