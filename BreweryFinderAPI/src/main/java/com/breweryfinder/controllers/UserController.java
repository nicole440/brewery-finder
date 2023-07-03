package com.breweryfinder.controllers;

import com.breweryfinder.models.Brewery;
import com.breweryfinder.dao.BreweryDao;
import com.breweryfinder.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
@CrossOrigin // Allow calls within domain but not from same port
public class UserController {

    @Autowired
    private UserDao userDao;
    @Autowired
    private BreweryDao breweryDao;

    public UserController(UserDao userDao, BreweryDao breweryDao) {
        this.userDao = userDao;
        this.breweryDao = breweryDao;
    }

    @RequestMapping(path="/breweries/favorites/{userId}", method = RequestMethod.GET)
    public List<Brewery> getUserFavorites(@PathVariable int userId) {
        List<Brewery> favoritesList = breweryDao.getFavoritesByUserId(userId);
        return favoritesList;
    }
}
