
    import cn.com.mvc.mapping.CustomerMapper;
    import cn.com.mvc.model.Customer;
    import org.springframework.context.ApplicationContext;
    import org.springframework.context.support.ClassPathXmlApplicationContext;

    import java.sql.Date;
    import java.util.List;


    public class Main {

        public static void main(String[] args) throws Exception{
            ApplicationContext context=new ClassPathXmlApplicationContext("config/spring/applicationContext.xml");
            CustomerMapper dao=(CustomerMapper)context.getBean("customerDao");
            List<Customer> customers=dao.selectAll();
            for(int i=0;i<customers.size();i++){
                System.out.println(customers.get(i).getId());
            }


        }
    }

