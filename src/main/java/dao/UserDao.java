package dao;

import entity.User;

/**
 * (User)Dao层
 *
 * @author hui
 * @date 2020-10-27 10:54:06
 */
public interface UserDao {
    /**
     * 保存用户
     *
     * @param user User对象
     * @return true/false
     */
    boolean saveUser(User user);

    /**
     * 删除用户
     *
     * @param id 用户id
     * @return true/false
     */
    boolean removeUser(int id);

    /**
     * 更新用户
     *
     * @param user User对象
     * @return true/false
     */
    boolean updateUser(User user);

    /**
     * 根据id查询用户
     *
     * @param id 用户id
     * @return User对象
     */
    User getUser(int id);

    /**
     * 根据用户名查询用户
     *
     * @param username 用户名
     * @return User对象
     */
    User getUser(String username);

}
