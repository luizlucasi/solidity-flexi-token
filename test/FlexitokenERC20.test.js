const { expect } = require("chai");

describe("FlexiTokenERC20", function () {
  let FlexiTokenERC20, flexiToken, owner, addr1, addr2;

  // Deploy the contract before running tests
  beforeEach(async function () {
    FlexiTokenERC20 = await ethers.getContractFactory("FlexiTokenERC20");
    [owner, addr1, addr2] = await ethers.getSigners();
    flexiToken = await FlexiTokenERC20.deploy();
    await flexiToken.deployed();
  });

  // Test to verify initial token supply was minted to the owner
  it("Should assign the initial token supply to the owner", async function () {
    const ownerBalance = await flexiToken.balanceOf(owner.address);
    expect(await flexiToken.totalSupply()).to.equal(ownerBalance);
  });

  // Test to ensure only the owner can mint new tokens
  it("Should allow only the owner to mint tokens", async function () {
    await flexiToken.mint(addr1.address, 1000);
    const addr1Balance = await flexiToken.balanceOf(addr1.address);
    expect(addr1Balance).to.equal(1000);
  });

  // Test to ensure non-owners cannot mint tokens
  it("Should fail if non-owner tries to mint tokens", async function () {
    await expect(
      flexiToken.connect(addr1).mint(addr2.address, 1000)
    ).to.be.revertedWith("Only the owner can call this function");
  });

  // Test to check if total supply increases when new tokens are minted
  it("Should increase the total supply when new tokens are minted", async function () {
    const initialSupply = await flexiToken.totalSupply();
    await flexiToken.mint(owner.address, 5000);
    expect(await flexiToken.totalSupply()).to.equal(initialSupply.add(5000));
  });
});
