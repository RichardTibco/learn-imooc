package com.tuyrk.handler2;

import com.tuyrk.handler.PriceHandler;

/**
 * 责任链模式
 * 销售小组长，可以批准15%以内的折扣
 *
 * @author tuyrk
 */
public class Lead extends PriceHandler {
    @Override
    public void processDiscount(float discount) {
        if (discount <= 0.15) {
            System.out.format("%s批准了折扣：%.2f%n", this.getClass().getName(), discount);
        } else {
            successor.processDiscount(discount);
        }
    }
}
