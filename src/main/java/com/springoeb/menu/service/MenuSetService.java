package com.springoeb.menu.service;

import com.springoeb.menu.model.MenuSet;
import com.springoeb.menu.repository.MenuSetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuSetService {
    @Autowired
    private MenuSetRepository menuSetRepository;

    public List<MenuSet> getMenuSets(){
        return menuSetRepository.findAll();
    }

    public MenuSet getMenuSetByMenuSetNo(int menuSetNo){
        return menuSetRepository.getMenuSetByMenuSetNo(menuSetNo);
    }

    public boolean chkDuplicateMenuSet(MenuSet menuSet){
        List<MenuSet> menuSets = menuSetRepository.findByMenuSetNameTHIgnoreCaseOrMenuSetNameENIgnoreCase(menuSet.getMenuSetNameTH(),menuSet.getMenuSetNameEN());
        if(menuSets != null && menuSets.size() != 0){
            if(menuSets.size() > 1) {
                return true;
            }else{
                if(menuSet.getMenuSetNo() != null && menuSets.get(0).getMenuSetNo() == menuSet.getMenuSetNo()){
                    return false;
                }else{
                    return true;
                }
            }
        }else{
            return false;
        }
    }

    public MenuSet getMenuSetByMenuSetNameTH(String menuSetNameTH){ return menuSetRepository.findMenuSetByMenuSetNameTH(menuSetNameTH); }

    public void save(MenuSet menuSet){
        menuSetRepository.save(menuSet);
    }

    public void delMenuSet(int menuSetNo){
        menuSetRepository.removeByMenuSetNo(menuSetNo);
    }
}
