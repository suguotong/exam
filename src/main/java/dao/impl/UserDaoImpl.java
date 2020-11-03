package dao.impl;

import dao.UserDao;
import entity.User;
import util.DbUtil;

/**
 * @author hui
 * @date 2020-10-27 11:01:52
 */
public class UserDaoImpl implements UserDao {
    @Override
    public boolean saveUser(User user) {
        return DbUtil.save("insert into liangzhenhui_user (username, password, gender, email, phone) values(?,?,?,?,?)",
                user.getUsername(),
                user.getPassword(),
                user.getGender(),
                user.getEmail(),
                user.getPhone());
    }

    @Override
    public boolean removeUser(int id) {
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }

    @Override
    public User getUser(int id) {
        return null;
    }

    @Override
    public User getUser(String username) {
        return DbUtil.query(User.class, "select * from liangzhenhui_user where username = ?", username);
    }
}
