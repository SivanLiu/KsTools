package cn.wjdiankong.hookpms;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class PmsHookBinderInvocationHandler implements InvocationHandler {
    private Object base;
    private String SIGN;

    public PmsHookBinderInvocationHandler(Object base, String sign) {
        try {
            this.base = base;
            this.SIGN = sign;
        } catch (Exception var4) {
            Log.d("jw", "error:" + Log.getStackTraceString(var4));
        }
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if ("getPackageInfo".equals(method.getName())) {
            Integer flag = (Integer) args[1];
            if (flag == 64) {
                Signature sign = new Signature(this.SIGN);
                PackageInfo info = (PackageInfo) method.invoke(this.base, args);
                info.signatures[0] = sign;
                return info;
            }
        }

        return method.invoke(this.base, args);
    }
}
