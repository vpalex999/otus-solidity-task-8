// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.28;

/**
 * @title Интерфейс токена ERC20
 * @author vpalex@mail.ru
 * @notice учебный интерфейс
 */
interface IERC20 {
    /**
     * @return Возвращает общее количество токенов в обороте
     */
    function totalSupply() external view returns (uint256);

    /**
     * @notice возвращает баланс учетной записи пользователя.
     * @param _owner адрес пользователя.
     * @return balance значение баланса пользователя.
     */
    function balanceOf(address _owner) external view returns (uint balance);

    /**
     * @notice передача пользователем токенов на другой адрес.
     * @param _to адрес получателя.
     * @param _value количество передаваемых токенов.
     * @return success возвращает флаг успешности передачи.
     * @dev должна делать event Transfer.
     * @dev должна вызывать исключение, если на балансе пользователя недостаточно средств.
     */
    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success);

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success);
}
