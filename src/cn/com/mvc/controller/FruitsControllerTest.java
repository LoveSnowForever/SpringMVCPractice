package cn.com.mvc.controller;

import cn.com.mvc.model.Fruits;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class FruitsControllerTest implements Controller {
    private FruitsService fruitsService=new FruitsService();
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<Fruits> fruitsList=fruitsService.queryFruitsList();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("fruitList",fruitsList);
        modelAndView.setViewName("/WEB-INF/jsp/fruits/fruitsList.jsp");
        return null;
    }

    class FruitsService{
        public List<Fruits> queryFruitsList(){
            ArrayList<Fruits> fruits=new ArrayList<>();
             Fruits apple=new Fruits();
             apple.setName("红富士苹果");
             apple.setPrice(2.3);
             apple.setProduction_area("山东");

             Fruits banala=new Fruits();
             banala.setName("香蕉");
             banala.setPrice(1.5);
             banala.setProduction_area("上海");

             fruits.add(apple);
             fruits.add(banala);
             return fruits;
        }

    }
}
