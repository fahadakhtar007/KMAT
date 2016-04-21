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
public class Process {
    private Integer process_id;
    private Integer root_node_idfk;
    private String process_name;
    private String description;
    private String create_dt;
    private String update_dt;

    public Process() {
        root_node_idfk=0;
    }

    public Integer getProcess_id() {
        return process_id;
    }

    public void setProcess_id(Integer process_id) {
        this.process_id = process_id;
    }

    public Integer getRoot_node_idfk() {
        return root_node_idfk;
    }

    public void setRoot_node_idfk(Integer root_node_idfk) {
        this.root_node_idfk = root_node_idfk;
    }

    public String getProcess_name() {
        return process_name;
    }

    public void setProcess_name(String process_name) {
        this.process_name = process_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
