package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description")
        );

        boolean inputHasErrors = ad.getTitle().isEmpty() || ad.getDescription().isEmpty();

        if (inputHasErrors) {
            showMessageDialog(null,
                    "A blank field(s) was detected. Please fix your error(s) and try again.");

            HashMap<String, String> oldInput = new HashMap<>();

            oldInput.put("title", ad.getTitle());
            oldInput.put("description", ad.getDescription());

            request.getSession().setAttribute("oldInput", oldInput);

            response.sendRedirect("/ads/create");
        } else {
            // create and save a new ad
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/ads");
        }
    }
}
