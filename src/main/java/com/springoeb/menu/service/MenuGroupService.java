package com.springoeb.menu.service;

import com.springoeb.cashier.repository.OrderRepository;
import com.springoeb.menu.model.MenuGroup;
import com.springoeb.menu.repository.MenuGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuGroupService {
    @Autowired
    private MenuGroupRepository menuGroupRepository;
    @Autowired
    private OrderRepository orderRepository;

    public List<MenuGroup> getMenuGroups(int restNo){
        return menuGroupRepository.findByRestNo(restNo);
    }
    public List<MenuGroup> getMenuGroupsOrderByMenuCatNo(int restNo){
        return menuGroupRepository.findByMenuGroupNoIsNotNullAndRestNoOrderByMenuCatNo(restNo);
    }

    public void save(MenuGroup menuGroup){
        menuGroupRepository.save(menuGroup);
    }

    public void delMenuGroup(int menuGroup){
        menuGroupRepository.removeByMenuGroupNo(menuGroup);
    }

    public MenuGroup getMenuGroup(int menuCatNo){
        return menuGroupRepository.findByMenuGroupNo(menuCatNo);
    }

    public boolean chkDuplicateMenuGroup(MenuGroup menuGroup){
        List<MenuGroup> menuCategories = menuGroupRepository.findByMenuGroupNameTHIgnoreCaseOrMenuGroupNameENIgnoreCase(menuGroup.getMenuGroupNameTH(),menuGroup.getMenuGroupNameEN());
        if(menuCategories != null && menuCategories.size() != 0){
            if(menuCategories.size() > 1) {
                return true;
            }else{
                if(menuGroup.getMenuGroupNo() != null && menuCategories.get(0).getMenuGroupNo() == menuGroup.getMenuGroupNo()){
                    return false;
                }else{
                    return true;
                }
            }
        }else{
            return false;
        }
    }

//    public Map<MenuGroup,Long> getBestSaleMenuGroup(int restNo){
//        Map<MenuGroup,Long> menuGroupMaps = new LinkedHashMap<MenuGroup,Long>();
//        List<MenuGroup> menuGroups = menuGroupRepository.findByRestNo(restNo);
//        for(MenuGroup mg : menuGroups){
//            long count = orderRepository.sumByMenu_MenuGroupNo(mg.getMenuGroupNo());
//            menuGroupMaps.put(mg,count);
//        }
//        return menuGroupMaps;
//    }
}
