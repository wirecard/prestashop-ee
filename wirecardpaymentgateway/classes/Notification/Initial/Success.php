<?php

namespace WirecardEE\Prestashop\Classes\Notification\Initial;

use WirecardEE\Prestashop\Classes\Notification\ProcessablePaymentNotification;
use \WirecardEE\Prestashop\Classes\Notification\Success as AbstractSuccess;

class Success extends AbstractSuccess implements ProcessablePaymentNotification
{
    public function process()
    {
        parent::process(); // TODO: Change the autogenerated stub
    }
}
