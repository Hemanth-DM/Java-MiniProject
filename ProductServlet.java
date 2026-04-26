package product_management;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    // ================= GET =================
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            deleteProduct(req, res);
        } 
        else if ("search".equals(action)) {
            searchProducts(req, res);
        } 
        else {
            listProducts(req, res);
        }
    }

    // ================= POST =================
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            insertProduct(req, res);
        } 
        else if ("update".equals(action)) {
            updateProduct(req, res);
        }
    }

    // ================= ADD =================
    private void insertProduct(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO products(name, category, price, quantity) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("category"));
            ps.setDouble(3, Double.parseDouble(req.getParameter("price")));
            ps.setInt(4, Integer.parseInt(req.getParameter("quantity")));

            ps.executeUpdate();

            res.sendRedirect(req.getContextPath() + "/ProductServlet");

        } catch (Exception e) {
            res.getWriter().println(e);
        }
    }

    // ================= UPDATE =================
    private void updateProduct(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "UPDATE products SET name=?, category=?, price=?, quantity=? WHERE id=?"
            );

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("category"));
            ps.setDouble(3, Double.parseDouble(req.getParameter("price")));
            ps.setInt(4, Integer.parseInt(req.getParameter("quantity")));
            ps.setInt(5, Integer.parseInt(req.getParameter("id")));

            ps.executeUpdate();

            res.sendRedirect(req.getContextPath() + "/ProductServlet");

        } catch (Exception e) {
            res.getWriter().println(e);
        }
    }

    // ================= DELETE =================
    private void deleteProduct(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM products WHERE id=?"
            );

            ps.setInt(1, Integer.parseInt(req.getParameter("id")));

            ps.executeUpdate();

            res.sendRedirect(req.getContextPath() + "/ProductServlet");

        } catch (Exception e) {
            res.getWriter().println(e);
        }
    }

    // ================= SEARCH =================
    private void searchProducts(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {

            String keyword = req.getParameter("keyword");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM products WHERE name LIKE ?"
            );

            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.populate(rs);

            req.setAttribute("rs", crs);
            req.getRequestDispatcher("viewProduct.jsp").forward(req, res);

        } catch (Exception e) {
            res.getWriter().println(e);
        }
    }

    // ================= LIST =================
    private void listProducts(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM products");

            CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.populate(rs);

            req.setAttribute("rs", crs);
            req.getRequestDispatcher("viewProduct.jsp").forward(req, res);

        } catch (Exception e) {
            res.getWriter().println(e);
        }
    }
}
