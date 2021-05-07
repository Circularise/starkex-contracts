// SPDX-License-Identifier: MIT

pragma solidity ^0.6.11;

import "../tokens/ERC1155/IERC1155Receiver.sol";

/**
 * @dev _Available since v3.1._
 */
abstract contract ERC1155Receiver is IERC1155Receiver {
    constructor() public {
        _registerInterface(
            ERC1155Receiver(0).onERC1155Received.selector ^
                ERC1155Receiver(0).onERC1155BatchReceived.selector
        );
    }
}
