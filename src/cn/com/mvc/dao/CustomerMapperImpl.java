package cn.com.mvc.dao;

import cn.com.mvc.mapping.CustomerMapper;
import cn.com.mvc.model.Customer;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;

public class CustomerMapperImpl extends SqlSessionDaoSupport implements CustomerMapper {
    @Override
    protected void initDao() throws Exception {
        super.initDao();
    }

    public CustomerMapperImpl() {
        super();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Customer record) {
        return 0;
    }

    @Override
    public int insertSelective(Customer record) {
        return 0;
    }

    @Override
    public Customer selectByPrimaryKey(Integer id) {
        SqlSession sqlSession=this.getSqlSession();
        Customer customer=sqlSession.selectOne("test.selectByPrimaryKey",id);
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Customer record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Customer record) {
        return 0;
    }

    @Override
    public List<Customer> selectAll() {
        return null;
    }
}
