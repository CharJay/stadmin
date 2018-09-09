package com.xm.autho.common.utils;

import java.util.List;

public class TreeNode {

    private Long id;
    private Long pid;
    private String name;
    private String key;
    private String icon;
    private String url;
    private Integer selected;
    private boolean spread;
    private List<TreeNode> children;

    public TreeNode() {
    }


    public TreeNode(Long id, Long pid, String name, String key, String icon, String url) {
        super();
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.key = key;
        this.icon = icon;
        this.url = url;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getSelected() {
        return selected;
    }

    public void setSelected(Integer selected) {
        this.selected = selected;
    }
}
