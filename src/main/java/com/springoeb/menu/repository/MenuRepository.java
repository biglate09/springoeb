package com.springoeb.menu.repository;

import com.springoeb.menu.model.Menu;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends CrudRepository<Menu,Integer>{
    public List<Menu> findAllByMenuFlag(String menuFlag);
    public List<Menu> findAllByMenuFlagAndLocalFlagIn(String menuFlag,List<Integer> localFlag);
    public List<Menu> findByMenuGroupNo(int menuGroupNo);
    public List<Menu> findByMenuGroupNoAndMenuFlagAndLocalFlagIn(int menuGroupNo,String menuFlag,List<Integer> localFlag);
    public List<Menu> findByMenuNameTHIgnoreCaseOrMenuNameENIgnoreCase(String menuNameTH, String menuNameEN);
    public List<Menu> findByMenuFlagAndLocalFlagNotInAndRestNoOrderByLocalFlagAsc(String menuFlag,List<Integer> localFlag,int restNo);
    public List<Menu> findByMenuFlagAndMenuGroupNoAndLocalFlagNotInAndRestNoOrderByLocalFlagAsc(String menuFlag,int menuGroupNo, List<Integer> localFlag,int restNo);
    public List<Menu> findByLocalFlagAndRestNo(int localFlag,int restNo);
    public Menu findByMenuNameTH(String menuNameTH);
    public void deleteByMenuNo(int menuNo);
    public Menu findByMenuNo(int menuNo);
}
