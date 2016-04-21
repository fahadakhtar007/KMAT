/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SourceClasses;

/**
 *
 * @author Pc
 */
public class Group {
    private Integer group_id;
    private Integer created_by_idfk;
    private String group_name;
    private String description;
    private String privacy_level_idfk;
    private String create_dt;
    private String update_dt;

    public Integer getGroup_id() {
        return group_id;
    }

    public void setGroup_id(Integer group_id) {
        this.group_id = group_id;
    }

    public Integer getCreated_by_idfk() {
        return created_by_idfk;
    }

    public void setCreated_by_idfk(Integer created_by_idfk) {
        this.created_by_idfk = created_by_idfk;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrivacy_level_idfk() {
        return privacy_level_idfk;
    }

    public void setPrivacy_level_idfk(String privacy_level_idfk) {
        this.privacy_level_idfk = privacy_level_idfk;
    }

    public String getCreate_dt() {
        return create_dt;
    }

    public void setCreate_dt(String create_dt) {
        this.create_dt = create_dt;
    }

    public String getUpdate_dt() {
        return update_dt;
    }

    public void setUpdate_dt(String update_dt) {
        this.update_dt = update_dt;
    }
    
    
}
