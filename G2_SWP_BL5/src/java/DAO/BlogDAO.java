/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Model.Blog;
import Model.BlogCategory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SHD
 */
public class BlogDAO extends DBContext {

   public List<Blog> getListBlogs(String search, String cateId, String sortType, String index) {
    int curIndex = Integer.valueOf(index);
    String orderBy = "ORDER BY b.blog_id ASC";
    switch (sortType) {
        case "1":
            orderBy = "ORDER BY b.title ASC";
            break;
        case "2":
            orderBy = "ORDER BY b.title DESC";
            break;
        case "3":
            orderBy = "ORDER BY b.createDate DESC";
            break;
    }
    
    List<Blog> listB = new ArrayList<>();
    String sql = "SELECT * FROM Blog b JOIN categoryBlog c ON b.cate_id = c.categoryBlog_id "
            + "WHERE b.title LIKE ? AND b.status = 1 ";
    
    if (!cateId.isEmpty()) {
        sql += "AND b.cate_id = ? ";
    }
    
    // Use OFFSET and FETCH NEXT instead of LIMIT for SQL Server
    sql += orderBy + " LIMIT 9 OFFSET ?";
    
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        
        // Set the search parameter
        stm.setString(1, "%" + search + "%");
        
        int paramIndex = 2;
        // Set the category ID if provided
        if (!cateId.isEmpty()) {
            stm.setInt(paramIndex++, Integer.parseInt(cateId));
        }
        
        // Calculate the offset for pagination (curIndex - 1) * 9
        stm.setInt(paramIndex, (curIndex - 1) * 9);
        
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Blog b = new Blog(rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getDate(6),
                    rs.getString(7));
            b.setCategory(rs.getString(11));
            listB.add(b);
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return listB;
}


    public List<Blog> getTop3ListBlogs() {
        List<Blog> listB = new ArrayList<>();
        String sql = "SELECT * FROM Blog b JOIN categoryBlog c ON b.cate_id = c.categoryBlog_id "
                + "WHERE b.cate_id = 1 ORDER BY b.createDate DESC LIMIT 3";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7)
                );
                b.setCategory(rs.getString(11));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public int countBlogs() {
        String sql = "select count(*) from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<BlogCategory> getBlogCategories() {
        List<BlogCategory> listB = new ArrayList<>();
        String sql = "  select * from categoryBlog";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BlogCategory b = new BlogCategory(rs.getInt(1),
                        rs.getString(2));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public Blog getDetailBlogs(String bid) {
        String sql = "  select * from Blog b join categoryBlog c on b.cate_id = c.categoryBlog_id\n"
                + "  where b.blog_id = " + bid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7));
                b.setCategory(rs.getString(11));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Blog getBlogDetail(String id) {
        String sql = "select * from [Blog]\n"
                + "where blog_id = ?";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief_info;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                xId = rs.getInt("id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief_info = rs.getString("brief_info");
                x = new Blog(xId, xTitle, xFlag, xFlag, xBrief_info, xCreated, xContent, xCategory, xStatus, xContent, xThumbnail, xFlag, xModified);
            }
        } catch (Exception e) {
        }
        return x;
    }

    public List<Blog> getBlogList() {
        List<Blog> t = new ArrayList<>();
        String sql = "select * from [Blog]";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                xId = rs.getInt("blog_id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief = rs.getString("brief_info");
                x = new Blog(xId, xTitle, xBrief, xFlag, xBrief, xCreated, xContent, xCategory, xStatus, xContent, xThumbnail, xFlag, xModified);
                t.add(x);
            }
        } catch (Exception e) {
        }
        return t;
    }

    public String getAuthor(int id) {
        String sql = "select full_name from [user_profile]\n"
                + "where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getCategoryName(int id) {
        String sql = "select name from [blog_category]\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Blog> searchPost(String keyword) {
        List<Blog> resultPost = new ArrayList<>();
        String sql = "select * from [blog] where title like ?";
        int xId;
        String xThumbnail;
        int xAuthor_id;
        String xTitle;
        int xCategory;
        String xFlag;
        boolean xStatus;
        String xContent;
        Date xCreated;
        Date xModified;
        String xBrief;
        Blog x = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                xId = rs.getInt("id");
                xThumbnail = rs.getString("thumbnail");
                xAuthor_id = rs.getInt("author_id");
                xTitle = rs.getString("title");
                xCategory = rs.getInt("category_id");
                xFlag = rs.getString("flag");
                xStatus = rs.getBoolean("status");
                xContent = rs.getString("content");
                xCreated = rs.getDate("created");
                xModified = rs.getDate("modified");
                xBrief = rs.getString("brief_info");
                x = new Blog(xId, xTitle, keyword, xFlag, xBrief, xCreated, xContent, xCategory, xStatus, keyword, xThumbnail, xFlag, xModified);
                resultPost.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (resultPost);
    }

    public void updateBlogWithThumbnail(Blog x) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [thumbnail] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[flag] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[brief_info] = ?\n"
                + "      ,[blog_content] = ?\n"
                + "      ,[modified] = GETDATE()\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getThumbnail());
            ps.setString(2, x.getTitle());
            ps.setInt(3, x.getCate_id());
            ps.setString(4, x.getFlag());
            ps.setBoolean(5, x.isStatus());
            ps.setString(6, x.getBrief_info());
            ps.setString(7, x.getBlog_content());
            ps.setInt(8, x.getBlog_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public void updateBlogWithoutThumbnail(Blog x) {
        String sql = "UPDATE [dbo].[blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[flag] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[brief_info] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[modified] = GETDATE()\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getTitle());
            ps.setInt(2, x.getCate_id());
            ps.setString(3, x.getFlag());
            ps.setBoolean(4, x.isStatus());
            ps.setString(5, x.getBrief_info());
            ps.setString(6, x.getBlog_content());
            ps.setInt(7, x.getBlog_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public void createBlog(String title, int authorId, String image, String briefInfo, String blogContent, 
        String categoryId, boolean status, String thumbnail, String flag, int numberOfAccess) {
    String sql = "INSERT INTO Blog (title, author, image, brief_infor, createDate, blog_content, cate_id, status, thumbnail, flag, dateModified, numberOfAccess) "
            + "VALUES (?, ?, ?, ?, NOW(),?, ?, ?, ?, ?, NOW(), ?)";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, title);
        ps.setInt(2, authorId);
        ps.setString(3, image);
        ps.setString(4, briefInfo);
        ps.setString(5, blogContent);
        ps.setString(6, categoryId);
        ps.setBoolean(7, status);
        ps.setString(8, thumbnail);
        ps.setString(9, flag);
        ps.setInt(10, numberOfAccess);

        ps.executeUpdate();

    } catch (SQLException e) {
        // Xử lý exception
        e.printStackTrace();
    }
}
public void updateBlog(String title, String image, String briefInfo, String blogContent, 
        String categoryId, boolean status, String thumbnail, String flag, int numberOfAccess, String blog_id) {
    String sql = "UPDATE Blog SET title = ?, image = ?, brief_infor = ?, blog_content = ?, cate_id = ?, "
            + "status = ?, thumbnail = ?, flag = ?, numberOfAccess = ?, dateModified = NOW() "
            + "WHERE blog_id = ?";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, image);
        ps.setString(3, briefInfo);
        ps.setString(4, blogContent);
        ps.setString(5, categoryId);
        ps.setBoolean(6, status);
        ps.setString(7, thumbnail);
        ps.setString(8, flag);
        ps.setInt(9, numberOfAccess);
        ps.setString(10, blog_id);

        ps.executeUpdate();
    } catch (SQLException e) {
        // Handle the exception
        e.printStackTrace();
    }
}

public void updateStatusBlog(boolean status, String blog_id) {
    String sql = "UPDATE Blog SET status = ?, dateModified = NOW() WHERE blog_id = ?";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setBoolean(1, status);
        ps.setString(2, blog_id);

        ps.executeUpdate();
    } catch (SQLException e) {
        // Handle the exception
        e.printStackTrace();
    }
}
public Blog getDetailBlog(String bid) {
    String sql = "SELECT * FROM Blog WHERE blog_id = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setString(1, bid);
        try (ResultSet rs = stm.executeQuery()) {
            if (rs.next()) {
                Blog b = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getBoolean(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getDate(12),
                          rs.getInt(13)
                );
                return b;
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return null;
}
 public List<Blog> getAllBlogsByAuthor(int author_id) {
        List<Blog> listB = new ArrayList<>();
        String sql = "SELECT * FROM Blog b "
                + "WHERE author = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, author_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt("blog_id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getInt("author") + "");
                b.setBlog_content(rs.getString("blog_content"));
                b.setCreateDate(rs.getDate("createDate"));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public List<Blog> getAllBlogsUpdated() {
        List<Blog> listB = new ArrayList<>();
        String sql = "SELECT * FROM Blog b ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt("blog_id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getInt("author") + "");
                b.setBlog_content(rs.getString("blog_content"));
                b.setCreateDate(rs.getDate("createDate"));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }


    public static void main(String[] args) {
        // Tạo một đối tượng BlogDAO để thêm vào cơ sở dữ liệu
       BlogDAO blogDAO = new BlogDAO();
    
//     Giả sử bạn có một blog_id cụ thể để kiểm thử, ví dụ "1"
    String blogIdToTest = "11";
    
    // Gọi hàm getDetailBlogs với blog_id cụ thể
    Blog blogDetail = blogDAO.getDetailBlog(blogIdToTest);

    // Kiểm tra xem hàm đã trả về thông tin blog chưa
    if (blogDetail != null) {
        System.out.println("Blog Detail:");
        System.out.println("Blog ID: " + blogDetail.getBlog_id());
        System.out.println("Title: " + blogDetail.getTitle());
        System.out.println("Author: " + blogDetail.getAuthor());
        System.out.println("Image: " + blogDetail.getImage());
        System.out.println("Brief Info: " + blogDetail.getBrief_info());
        System.out.println("Create Date: " + blogDetail.getCreateDate());
        System.out.println("Blog Content: " + blogDetail.getBlog_content());
        System.out.println("Category: " + blogDetail.getCategory());
          System.out.println("getFlag: " + blogDetail.getFlag());
            System.out.println("getCate_id: " + blogDetail.getCate_id());
              System.out.println("getStatus: " + blogDetail.isStatus());
    } else {
        System.out.println("Không tìm thấy blog với blog_id = " + blogIdToTest);
    }
     // Test parameters
            String search = ""; // You can change this to test different search terms
            String cateId = ""; // Leave empty for all categories or set a specific ID
            String sortType = ""; // Change based on sorting preference
            String index = "1"; // Page
     List<Blog> blogs = blogDAO.getListBlogs(search, cateId, sortType, index);
        for (Blog blog : blogs) {
            System.out.println("Blogs la:" + blog); 
        }
    
    }
}
