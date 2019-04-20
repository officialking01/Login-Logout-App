package my;

import java.sql.*;

public class DataBaseBean {

    private Connection con;
    private Statement st;
    private PreparedStatement checkLogin, insertUser;

    public DataBaseBean() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginlogout", "root", "incapp");
        st = con.createStatement();
        checkLogin = con.prepareStatement("select * from user_info where Email=? and Password=?");
        insertUser = con.prepareStatement("insert into user_info values(?,?,?,?,?)");

    }

    public java.util.HashMap checkLogin(String e, String p) throws Exception {

        checkLogin.setString(1, e);
        checkLogin.setString(2, p);
        ResultSet rs = checkLogin.executeQuery();
        if (rs.next()) {
            java.util.HashMap hm = new java.util.HashMap();
            hm.put("name", rs.getString("Name"));
            hm.put("email", rs.getString("Email"));
            hm.put("phone", rs.getString("Phone"));
            hm.put("age", rs.getInt("Age"));
            return hm;
        } else {

            return null;
        }

    }

    public java.util.HashMap insertUser(String e, String n, String ph, int a, String p) throws Exception {
        try {
            insertUser.setString(1, e);
            insertUser.setString(2, n);
            insertUser.setString(3, ph);
            insertUser.setInt(4, a);
            insertUser.setString(5, p);
            int x = insertUser.executeUpdate();
            if (x != 0) {
                java.util.HashMap hm = new java.util.HashMap();
                hm.put("name", n);
                hm.put("email", e);
                hm.put("phone", ph);
                hm.put("age", a);
                return hm;
            }else{
                return null;
            }

        } catch (java.sql.SQLIntegrityConstraintViolationException ex) {
            java.util.HashMap hm = new java.util.HashMap();
            hm.put("msg", "Email ID Already Registered!");
            return hm;
        }

    }

}
