package com.tuyrk.static_proxy;

import java.util.Random;

/**
 * 一辆车实现可行驶的接口
 *
 * @author tuyrk
 */
public class Car implements Moveable {
    @Override
    public void move() {
        // 记录汽车行驶的时间
        /*long startTime = System.currentTimeMillis();
        System.out.println("汽车开始行驶...");*/

        // 实现开车
        try {
            System.out.println("汽车行驶中...");
            Thread.sleep(new Random().nextInt(1000));
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        /*long endTime = System.currentTimeMillis();
        System.out.println("汽车结束行驶...汽车行驶时间：" + (endTime - startTime) + "毫秒");*/
    }
}
