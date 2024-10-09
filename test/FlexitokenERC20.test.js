import { expect } from "chai";
import hardhat from "hardhat"; 

const { ethers } = hardhat; 

describe("FlexiTokenERC20", function () {
  let Token;
  let token;
  let owner;
  let addr1;
  let addr2;

  beforeEach(async function () {
    Token = await ethers.getContractFactory("FlexiTokenERC20");
    [owner, addr1, addr2] = await ethers.getSigners();
    token = await Token.deploy(); 
  });

  it("Initial test structure", async function () {
    expect(true).to.equal(true); // Placeholder test
  });
});
