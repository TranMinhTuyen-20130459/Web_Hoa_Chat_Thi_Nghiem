package database.dao;

import database.DbConnection;
import model.admin.Admin;
import model.common.RoleAdmin;
import model.common.StatusAcc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public int addAccoutAdmin(DbConnection connectDB,Admin admin){
        String sql = "INSERT INTO account_admins(username, password, id_role_admin, id_status_acc, full_name) VALUES (?,?,?,?,?)";
        PreparedStatement pre = connectDB.getPreparedStatement(sql);
        try {
            pre.setString(1,admin.getUsername());
            pre.setString(2,admin.getPassAD());
            pre.setInt(3, admin.getId_role_admin());
            pre.setInt(4,admin.getId_status_acc());
            pre.setString(5,admin.getFullname());
            return pre.executeUpdate();

        }catch (SQLException e){
            return 0;
        }

    }
    public boolean updateAccount(DbConnection connectDB, Admin admin) {
        String sql = "UPDATE account_admins SET id_role_admin=?,id_status_acc=?,password=?,full_name = ?, time_change_pass=CURRENT_TIMESTAMP WHERE username=?";
        PreparedStatement preState = connectDB.getPreparedStatement(sql);
        try {
            preState.setInt(1, admin.getId_role_admin());
            preState.setInt(2, admin.getId_status_acc());
            preState.setString(3, admin.getPassAD());
            preState.setString(4, admin.getFullname());
            preState.setString(5, admin.getUsername());
            int row = preState.executeUpdate();
            if (row > 0) return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<Admin> getAllAdmin(DbConnection connectDB) {
        List<Admin> result = new ArrayList<>();
        String sql = "SELECT username,full_name,R.id_role_admin,R.name_role,S.id_status_acc,S.name_status_acc" +
                " FROM account_admins A" +
                " JOIN role_admins R ON A.id_role_admin = R.id_role_admin" +
                " JOIN status_accs S ON A.id_status_acc = S.id_status_acc" +
                " WHERE R.id_role_admin <> 3";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                String username = rs.getString("username");
                String fullname = rs.getString("full_name");
                int id_role = rs.getInt("id_role_admin");
                String name_role = rs.getString("name_role");
                int id_status = rs.getInt("id_status_acc");
                String name_status = rs.getString("name_status_acc");
                Admin admin = new Admin(username, "", id_role, id_status, name_role, name_status, fullname);
                result.add(admin);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<RoleAdmin> getAllRoleAdmin(DbConnection connectDB) {
        List<RoleAdmin> result = new ArrayList<>();
        String sql = "SELECT id_role_admin,name_role FROM role_admins " +
                "WHERE id_role_admin <> 3 ";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                RoleAdmin roleAdmin = new RoleAdmin(rs.getInt("id_role_admin"), rs.getString("name_role"));
                result.add(roleAdmin);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<StatusAcc> getAllStatusAcc(DbConnection connectDB) {
        List<StatusAcc> result = new ArrayList<>();
        String sql = "SELECT id_status_acc,name_status_acc FROM status_accs";
        Statement statement = connectDB.getStatement();
        try {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                StatusAcc sttAcc = new StatusAcc(rs.getInt("id_status_acc"), rs.getString("name_status_acc"));
                result.add(sttAcc);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
