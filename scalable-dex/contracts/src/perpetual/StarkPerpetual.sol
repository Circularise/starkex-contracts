// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.6.11;

import "../interfaces/MainDispatcher.sol";
import "./components/PerpetualStorage.sol";

contract StarkPerpetual is MainDispatcher, PerpetualStorage {
    string public constant VERSION = "1.0.0";

    // TODO: add our new version (StarkWare_PerpetualTokensAndRamping_2021_1)? but how?
    //
    // Salt for a 8 bit unique spread of all relevant selectors. Pre-caclulated.
    // ---------- The following code was auto-generated. PLEASE DO NOT EDIT. ----------
    uint256 constant MAGIC_SALT = 15691;
    uint256 constant IDX_MAP_0 =
        0x3000000002000200000000000220022100000102300010000030103200010000;
    uint256 constant IDX_MAP_1 =
        0x1410000000002200200000002003321010000210132000020000;
    uint256 constant IDX_MAP_2 =
        0x3031200400000004003320020000000012022120020030000003000020;
    uint256 constant IDX_MAP_3 =
        0x100200003000100000000000000320000410000003000030000101210000000;

    // ---------- End of auto-generated code. ----------

    function getNumSubcontracts() internal pure override returns (uint256) {
        return 4;
    }

    function magicSalt() internal pure override returns (uint256) {
        return MAGIC_SALT;
    }

    function handlerMapSection(uint256 section)
        internal
        view
        override
        returns (uint256)
    {
        if (section == 0) {
            return IDX_MAP_0;
        } else if (section == 1) {
            return IDX_MAP_1;
        } else if (section == 2) {
            return IDX_MAP_2;
        } else if (section == 3) {
            return IDX_MAP_3;
        }
        revert("BAD_IDX_MAP_SECTION");
    }

    function expectedIdByIndex(uint256 index)
        internal
        pure
        override
        returns (string memory id)
    {
        if (index == 1) {
            id = "StarkWare_AllVerifiers_2020_1";
        } else if (index == 2) {
            id = "StarkWare_PerpetualTokensAndRamping_2021_1";
        } else if (index == 3) {
            id = "StarkWare_PerpetualState_2020_1";
        } else if (index == 4) {
            id = "StarkWare_PerpetualForcedActions_2020_1";
        } else {
            revert("UNEXPECTED_INDEX");
        }
    }

    function initializationSentinel() internal view override {
        string memory REVERT_MSG = "INITIALIZATION_BLOCKED";
        // This initializer sets state etc. It must not be applied twice.
        // I.e. it can run only when the state is still empty.
        require(int256(sharedStateHash) == 0, REVERT_MSG);
        require(int256(globalConfigurationHash) == 0, REVERT_MSG);
        require(systemAssetType == 0, REVERT_MSG);
    }
}
