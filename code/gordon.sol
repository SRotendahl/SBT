// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

import "@studydefi/money-legos/dydx/contracts/DydxFlashloanBase.sol";
import "@studydefi/money-legos/dydx/contracts/ICallee.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


/**
 * @title Gordon - a clever Flash loan handler
 * @dev Create an arbitrary sequence arbitrage based on a flash loan
 */
contract Gordon is ICallee, DydxFlashloanBase, Ownable {
    struct MyCustomData {
        address token;
        uint256 repayAmount;
        bytes data;
    }
    
    enum Instructions {
        SwapOnUniswap
    }
    
    function bytesToAddress (bytes memory b, uint start) pure private returns (address) {
        uint result = 0;
        for (uint i = start; i < start + 20; i++) {
            uint8 c = uint8(b[i]);
            if (c >= 48 && c <= 57) {
                result = result * 16 + (c - 48);
            }
            if(c >= 65 && c<= 90) {
                result = result * 16 + (c - 55);
            }
            if(c >= 97 && c<= 122) {
                result = result * 16 + (c - 87);
            }
        }
        return address(result);
    }
    

    /**
     * @dev Called after loan is granted, before money is paid back
     * @param  sender       The msg.sender to Solo
     * @param  account      The account from which the data is being sent
     * @param  data         Arbitrary data given by the sender
     */
    function callFunction(
        address sender,
        Account.Info memory account,
        bytes memory data
    ) public override {
        MyCustomData memory mcd = abi.decode(data, (MyCustomData));
        uint256 balOfLoanedToken = IERC20(mcd.token).balanceOf(address(this));
        
        // TODO: Encode your logic here
        // E.g. arbitrage, liquidate accounts, etc
        uint i = 0;
        while (i < mcd.data.length) {
            uint8 instr = uint8(mcd.data[i]);
            if (instr == uint8(Instructions.SwapOnUniswap)) {
                address to_asset = bytesToAddress(mcd.data, i+1);
                address from_asset = bytesToAddress(mcd.data, i+21);
                // DO SOMETHING
                
                // Increment i
                i += 41;
            }
        }
    
    }
    

    /**
     * @dev Initiate a flash loan
     * @param _solo    The address of the solo margin contract (dydx contract that enables the flash loan)
     * @param _token   The address of the token to be flash loaned
     * @param _amount  The amount of the token to be flash loaned
     * @param data     The information to pass to the callFunction
     */
    function initiateFlashLoan(address _solo, address _token, uint256 _amount, bytes calldata data)
        external
    {
        
        ISoloMargin solo = ISoloMargin(_solo);

        // Get marketId from token address
        uint256 marketId = _getMarketIdFromTokenAddress(_solo, _token);

        // Calculate repay amount (_amount + (2 wei))
        // Approve transfer from
        uint256 repayAmount = _getRepaymentAmountInternal(_amount);
        IERC20(_token).approve(_solo, repayAmount);

        // 1. Withdraw $
        // 2. Call callFunction(...)
        // 3. Deposit back $
        Actions.ActionArgs[] memory operations = new Actions.ActionArgs[](3);

        operations[0] = _getWithdrawAction(marketId, _amount);
        operations[1] = _getCallAction(
            // Encode MyCustomData for callFunction
            abi.encode(MyCustomData({token: _token, repayAmount: repayAmount, data: data}))
        );
        operations[2] = _getDepositAction(marketId, repayAmount);

        Account.Info[] memory accountInfos = new Account.Info[](1);
        accountInfos[0] = _getAccountInfo();

        solo.operate(accountInfos, operations);
    }
    
    address constant ETHER = address(0);
    /**
     * @dev Withdraw excess of a certain asset
     * @param _assetAddress  The asset to be withdrawn to the owner
     */
    function withdraw(
        address _assetAddress
    ) public onlyOwner  returns (bool) {
        uint assetBalance;
        if (_assetAddress == ETHER) {
            address self = address(this); // workaround for a possible solidity bug
            assetBalance = self.balance;
            msg.sender.transfer(assetBalance);
        } else {
            assetBalance = IERC20(_assetAddress).balanceOf(address(this));
            IERC20(_assetAddress).transfer(msg.sender, assetBalance);
        }
    }
}