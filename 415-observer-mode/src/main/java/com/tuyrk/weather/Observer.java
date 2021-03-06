package com.tuyrk.weather;

/**
 * 观察者接口。
 * 定义一个更新的接口，给那些在目标对象发生改变的时候被通知的对象
 *
 * @author tuyrk
 */
public interface Observer {
    /**
     * 更新的接口
     *
     * @param subject 传入的目标对象，方便获取相应的目标对象的状态
     */
    void update(WeatherSubject subject);
}
