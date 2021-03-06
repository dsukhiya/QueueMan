package qman;

/**
 * Created by sukhi on 18-03-2016.
 */

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import org.python.core.*;
import org.python.util.PythonInterpreter;

@Repository
public class CreationDAOImpl implements CreationDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Boolean status;
    private Boolean TokenStatus;
    private String Name;
    private Boolean isAdmin;
    private String oldPass;
    private users user;
    private Boolean passChangeStatus;
    private String Username;
    private Boolean tokenChangeStatus;
    private String MailId;
    private String Token;
    CreationService creationService;

    public void addContact(users user) {
        sessionFactory.getCurrentSession().save(user);
    }

    public Boolean CheckLogin(String Username, String Password) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("from users where username= :name");
            query.setString("name", Username);
            Object obj = query.uniqueResult();
            users usr = (users) obj;
            if (usr != null && usr.getPassword().trim().equals(Password)) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return status;
    }

    public String FetchName(String Username) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query NameQuery = session.createQuery("from users where username= :name");
            NameQuery.setString("name", Username);
            Object obj = NameQuery.uniqueResult();
            users usr = (users) obj;
            if (usr != null && usr.getName() !=null)
            {
                Name = usr.getName().trim();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return Name;
    }

    public String FetchUsername(String Name) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query UsernameQuery = session.createQuery("from users where name= :Name");
            UsernameQuery.setString("Name", Name);
            Object obj = UsernameQuery.uniqueResult();
            users usr = (users) obj;
            if (usr != null && usr.getName() !=null)
            {
                Username = usr.getUsername();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return Username;
    }

    public Boolean isAdmin(String Username, HttpServletRequest request) {
        try {
            users usr = getUser(Username, request);
            if (usr != null)
            {
                isAdmin = usr.getIsAdmin();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return isAdmin;
    }

    public String getExistingPass(String Username, HttpServletRequest request) {
        try {
            users usr = getUser(Username, request);
            if (usr != null)
            {
                oldPass = usr.getPassword();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return oldPass;
    }

    public users getUser(String Username, HttpServletRequest request) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query userQuery = session.createQuery("from users where name= :name");
            userQuery.setString("name", (String)request.getSession().getAttribute("UserSessionName"));
            Object obj = userQuery.uniqueResult();
            users usr = (users) obj;
            if (usr != null)
            {
                user = usr;
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return user;
    }

    public Boolean setNewPass(String Username, String oldPass, String newPass, HttpServletRequest request)
    {
        try {
            users usr = getUser(Username, request);
            if (usr != null)
            {
                Session session = sessionFactory.getCurrentSession();
                String updatePass = "UPDATE users set password = :Password " + "WHERE name = :Username";
                Query query = session.createQuery(updatePass);
                query.setParameter("Password", newPass);
                query.setParameter("Username", Username);
                int passUpdateresult = query.executeUpdate();
                if (passUpdateresult == 1) {
                    passChangeStatus = true;
                } else {
                    passChangeStatus = false;
                }
            }
            else{
                passChangeStatus = false;
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return passChangeStatus;
    }

    public Boolean UpdateZenToken(String Username, String ZenToken, HttpServletRequest request){
        try {
            users usr = getUser(Username, request);
            if (usr != null)
            {
                Session session = sessionFactory.getCurrentSession();
                String updateToken = "UPDATE users set accesstoken = :AccessToken " + "WHERE name = :Username";
                Query query = session.createQuery(updateToken);
                query.setParameter("AccessToken", ZenToken);
                query.setParameter("Username", Username);
                int tokenUpdateresult = query.executeUpdate();
                if (tokenUpdateresult == 1) {
                    tokenChangeStatus = true;
                } else {
                    tokenChangeStatus = false;
                }
            }
            else{
                tokenChangeStatus = false;
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return tokenChangeStatus;
    }

    public String FetchEmail(String Name){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query EmailQuery = session.createQuery("from users where name= :Name");
            EmailQuery.setString("Name", Name);
            Object obj = EmailQuery.uniqueResult();
            users usr = (users) obj;
            if (usr != null && usr.getMailId() !=null)
            {
                MailId = usr.getMailId();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return MailId;
    }

    public String FetchToken(String Name){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query TokenQuery = session.createQuery("from users where name= :Name");
            TokenQuery.setString("Name", Name);
            Object obj = TokenQuery.uniqueResult();
            users usr = (users) obj;
            if (usr != null && usr.getAccessToken() !=null)
            {
                Token = usr.getAccessToken();
            }
        } catch (Exception e) {
            System.out.println("Exception Caught" + e);
        }
        return Token;
    }

    public void Queue(HttpServletRequest request) {
        /*StringBuilder builder = new StringBuilder();*/
        try {
            request.getSession().setAttribute("UserSessionPage", "Queue");
            PythonInterpreter pi = new PythonInterpreter();
            pi.execfile("");
            /*String name = (String)request.getSession().getAttribute("UserSessionName");
            String email = FetchEmail(name);
            String token = FetchToken(name);
            Zendesk zd = new Zendesk.Builder("https://cliqr.zendesk.com")
                    .setUsername(email)
                    .setToken(token)
                    .build();

            builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            builder.append("<Tickets>\n");
            for (Ticket ticket: zd.getTickets()) {
                if(ticket.getStatus() == Status.NEW){
                    builder.append("<Ticket>\n");
                    builder.append("<id>"+ticket.getId()+"</id>\n");
                    builder.append("<priority>"+ticket.getPriority()+"</priority>\n");
                    builder.append("<subject>"+ticket.getSubject()+"</subject>\n");
                    builder.append("<status>"+ticket.getStatus()+"</status>\n");
                    builder.append("</Ticket>\n");
                }
            }
            builder.append("</Tickets>\n");*/
        }
        catch (Exception e){
        }
        /*return builder;*/
    }
}
