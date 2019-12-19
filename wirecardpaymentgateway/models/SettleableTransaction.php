<?php


namespace WirecardEE\Prestashop\Models;

use Wirecard\PaymentSdk\Response\SuccessResponse;
use WirecardEE\Prestashop\Helper\OrderManager;

interface SettleableTransaction
{
    /**
     * Get the sum of all child transactions.
     *
     * @return float
     */
    public function getProcessedAmount();

    /**
     * Get the remaining amount from the already processed amount to the total amount (amount).
     *
     * @return float
     */
    public function getRemainingAmount();

    /**
     * Get the total amount. regardless of whether it has been processed or not.
     *
     * @return float
     */
    public function getAmount();

    /**
     * Mark transaction as closed.
     *
     * Invariant: is settled.
     *
     * @return bool
     */
    public function markSettledAsClosed();

    /**
     * A transaction is settled if the processed amount is equal to the original (total) amount.
     *
     * @return bool
     */
    public function isSettled();

    /**
     * Update the order according to the newest processed state of the transaction.
     *
     * @param \Order $order
     * @param SuccessResponse $notification
     * @param OrderManager $orderManager
     * @return bool
     */
    public function updateOrder(\Order $order, SuccessResponse $notification, OrderManager $orderManager);
}
