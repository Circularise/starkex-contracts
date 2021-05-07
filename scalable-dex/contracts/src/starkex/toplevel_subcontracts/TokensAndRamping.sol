// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.6.11;

import "../../components/ERC721Receiver.sol";
import "../../components/ERC1155Receiver.sol";
import "../../components/Freezable.sol";
import "../../components/KeyGetters.sol";
import "../../components/Tokens.sol";
import "../../components/Users.sol";
import "../../components/MainGovernance.sol";
import "../../interactions/AcceptModifications.sol";
import "../../interactions/Deposits.sol";
import "../../interactions/StarkExForcedActionState.sol";
import "../../interactions/Withdrawals.sol";
import "../../interfaces/SubContractor.sol";

contract TokensAndRamping is
    ERC721Receiver,
    ERC1155Receiver,
    SubContractor,
    Freezable,
    MainGovernance,
    AcceptModifications,
    StarkExForcedActionState,
    Tokens,
    KeyGetters,
    Users,
    Deposits,
    Withdrawals
{
    function initialize(
        bytes calldata /* data */
    ) external override {
        revert("NOT_IMPLEMENTED");
    }

    function initializerSize() external view override returns (uint256) {
        return 0;
    }

    function identify() external pure override returns (string memory) {
        return "StarkWare_TokensAndRamping_2021_1";
    }
}
