package cn.com.mvc.controller;

import cn.com.mvc.mapping.CustomerMapper;
import cn.com.mvc.model.Customer;


import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("/config/spring/applicationContext.xml");
    CustomerMapper customerDao=(CustomerMapper)context.getBean("customerDao");
    @RequestMapping("queryById.action")
    public ModelAndView queryById(Model model){
        ModelAndView modelAndView=new ModelAndView();
        ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("/config/spring/applicationContext.xml");
        CustomerMapper customerDao=(CustomerMapper)context.getBean("customerDao");
        List<Customer> customers=new ArrayList<>();
        customers.add(customerDao.selectByPrimaryKey(10001));
        customers.add(customerDao.selectByPrimaryKey(10002));
        customers.add(customerDao.selectByPrimaryKey(10003));
        customers.add(customerDao.selectByPrimaryKey(10004));
        customers.add(customerDao.selectByPrimaryKey(10005));
        customers.add(customerDao.selectByPrimaryKey(10006));
        System.out.println(customers.size());
        //设置url
        modelAndView.setViewName("test");
        modelAndView.addObject("list",customers);
        return modelAndView;
    }

    @RequestMapping("queryCustomerAll.action")
    public ModelAndView queryAll(){
        ModelAndView modelAndView=new ModelAndView();
        List<Customer> customerList=new ArrayList<>();
        customerList=customerDao.selectAll();
        modelAndView.setViewName("test");
        modelAndView.addObject("list",customerList);
        return modelAndView;
    }

    @RequestMapping("deleteById")
    public void deleteById(){

    }

    @GetMapping("updateById.action")
    public  Customer updateById(@RequestBody Integer json){

        return new Customer() ;
    }

    @RequestMapping("insertCustomer.action")
    public void addCustomer(Customer customer){

    }


    @PostMapping("editCustomer.action")
    public @ResponseBody message editCustomer(@RequestBody Integer id){
//        int id=dd.getId();
        System.out.println(id);
        System.out.println(";llll");
        Customer customer=customerDao.selectByPrimaryKey(10001);

        return  new message();
    }
    public class message{
        Integer id;

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }
    }

    @RequestMapping("JQTest.action")
    @ResponseBody
    public  Object JQTest(@RequestBody String username,String time){
            System.out.println(username+",,,"+time);
            Customer cus=new Customer();
            cus.setId(10006);
            cus.setName("lichenghong");
            return cus;

    }
}
