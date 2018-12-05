/**   
* @Title: EncapsulationObject.java 
* @Package com.venada.eduonline.common.util 
* @Description: TODO(用一句话描述该文件做�?�?) 
* @author hepei Administrator   
* @date 2014�?3�?21�? 下午2:36:32 
* @version V1.0   
*/
package web;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

/** 
 * @ClassName: EncapsulationObject 
 * @Description: TODO(功能：该方法将request对象中的值封装到相应的pojo对象�? ) 
 * @author hepei
 * @date 2014�?3�?21�? 下午2:36:32  
 */
public class EncapsulationObject {  
    public static void getObjectFromRequest(Object obj,HttpServletRequest request) {  
        Class<?> cla = obj.getClass();//获得对象类型  
        Field field[] = cla.getDeclaredFields();//获得该类型中的所有属�?  
        for(int i=0;i<field.length;i++) {//遍历属�?�列�?  
            field[i].setAccessible(true);//禁用访问控制�?�?  
            Class<?> fieldType = field[i].getType();//获得属�?�类�?  
            String attr = request.getParameter(field[i].getName());//获得属�?��??  
            if(attr==null) {//如果属�?��?�为null则不做任何处理，直接进入下一轮循�?  
                continue;  
            }  
            /** 
             * 根据对象中属性类型的不同，将request对象中的字符串转换为相应的属�? 
             */  
			try {
				if (fieldType == String.class) {
					field[i].set(obj, attr);
				}else if (fieldType == Integer.class) {// 当转换失败时，设�?0
					field[i].set(obj, Integer.valueOf((request
							.getParameter(field[i].getName()))));
				}  else if (fieldType == int.class) {// 当转换失败时，设�?0
					field[i].set(obj, Integer.valueOf((request
							.getParameter(field[i].getName()))));
				} else if (fieldType == Date.class) {// 当转换失败时，设置为null
					if(request.getParameter(field[i].getName())==null){
						field[i].set(obj, new Date());
					}else if(request.getParameter(field[i].getName()).length()>10){
						field[i].set(obj, (DateUtils.parseDate(
								request.getParameter(field[i].getName()),
								"yyyy-MM-dd HH:mm:ss")));
					}else if(request.getParameter(field[i].getName()).length()==10){
						field[i].set(obj, (DateUtils.parseDate(
								request.getParameter(field[i].getName()),
								"yyyy-MM-dd")));
					}
					
				} else if (fieldType == BigDecimal.class) {
					field[i].set(
							obj,
							(new BigDecimal(request.getParameter(field[i]
									.getName()))));
				} else if (fieldType == Float.class) {// 当转换失败时，设置为null
					field[i].set(obj, (Float.valueOf(request
							.getParameter(field[i].getName()))));
				} else if (fieldType == Double.class) {// 当转换失败时，设置为null
					field[i].set(obj, (Double.valueOf(request
							.getParameter(field[i].getName()))));
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
        }  
    }  
}  