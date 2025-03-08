// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.28;

/**
 * @title Интерфейс токена ERC20
 * @author vpalex@mail.ru
 * @notice учебный интерфейс
 */
interface IERC20 {
    /**
     * @notice эвент должен срабатывать на передачу токенов включая 0 значение.
     * @param _from откуда.
     * @param _to куда.
     * @param _value сумма.
     */
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    /**
     * @notice эвент срабатывает при approval
     * @param _owner собственник.
     * @param _spender доверенный.
     * @param _value сумма.
     */
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

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
     * @dev должна вызывать ИСКЛЮЧЕНИЕ, если на балансе пользователя недостаточно средств.
     * @dev перевод 0 значения рассматривается как обычный перевод.
     */
    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success);

    /**
     * @notice передача токенов с одного адреса на другой адрес.
     * @notice может использоваться для вывода средств, разрешая контрактам действовать от вашего имени.
     * @param _from адрес источника.
     * @param _to адрес получателя.
     * @param _value сумма.
     * @return success возвращает флаг успешности передачи.
     * @dev должна делать event Transfer.
     * @dev должна вызывать ИСКЛЮЧЕНИЕ, если учетная запись намеренно не реализовала механизм авторизации.
     * @dev перевод 0 значения рассматривается как обычный перевод.
     */
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success);

    /**
     * @notice позволяет спендеру снимать сумму с вашего кошелька несколько раз до суммы ограничения.
     * @param _spender тот, кому разрешено работать от вашего имени.
     * @param _value сумма снятия.
     * @return success возвращает флаг успешности передачи.
     */
    function approve(
        address _spender,
        uint256 _value
    ) external returns (bool success);

    /**
     * @notice Возвращает сумму, которую _spender все еще может снять с _owner
     * @param _owner держатель.
     * @param _spender доверенный.
     * @return remaining оставшаяся сумма снятия.
     */
    function allowance(
        address _owner,
        address _spender
    ) external view returns (uint256 remaining);
}
