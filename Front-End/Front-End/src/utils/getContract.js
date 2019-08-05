import Web3 from 'web3'
import { address, ABI } from './contractABI'

const getContract = new Promise(function(resolve, reject) {
  const web3 = new Web3(window.web3.currentProvider)
  const casinoContract = web3.eth.contract(ABI)
  const casinoContractInstance = casinoContract.at(address)
  console.log(casinoContract)
  console.log(casinoContractInstance)
  resolve(casinoContractInstance)
})

export default getContract
