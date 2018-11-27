package com.test.services;

import java.util.List;

import com.test.models.Group;

public interface GroupService {
  public void insertGroup(Group g);
//  public List<Group> getAllgroups();
  public List<Group> getNotify(int currentid);
  
}
