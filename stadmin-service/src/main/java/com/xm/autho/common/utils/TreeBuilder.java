package com.xm.autho.common.utils;

import java.util.ArrayList;
import java.util.List;

import com.framework.core.utils.json.JacksonHelper;

public class TreeBuilder {
	List<TreeNode> nodes = new ArrayList<>();

    public String buildTree(List<TreeNode> nodes) {

        TreeBuilder treeBuilder = new TreeBuilder(nodes);

        return treeBuilder.buildJSONTree();
    }

    public TreeBuilder() {
    }

    public TreeBuilder(List<TreeNode> nodes) {
        super();
        this.nodes = nodes;
    }

    // 构建JSON树形结构
    public String buildJSONTree() {
        List<TreeNode> nodeTree = buildTree();
        String jsonStr = JacksonHelper.obj2jsonThrowRuntime(nodeTree);
        return jsonStr;
    }

    // 构建树形结构
    public List<TreeNode> buildTree() {
        List<TreeNode> treeNodes = new ArrayList<>();
        List<TreeNode> rootNodes = getRootNodes();
        for (TreeNode rootNode : rootNodes) {
            buildChildNodes(rootNode);
            treeNodes.add(rootNode);
        }
        return treeNodes;
    }

    // 递归子节点
    public void buildChildNodes(TreeNode node) {
        List<TreeNode> children = getChildNodes(node);
        if (!children.isEmpty()) {
            for (TreeNode child : children) {
                buildChildNodes(child);
            }
            node.setChildren(children);
        }
    }

    // 获取父节点下所有的子节点
    public List<TreeNode> getChildNodes(TreeNode pnode) {
        List<TreeNode> childNodes = new ArrayList<>();
        for (TreeNode n : nodes) {
            if (pnode.getId().equals(n.getPid())) {
                childNodes.add(n);
            }
        }
        return childNodes;
    }

    // 判断是否为根节点
    public boolean rootNode(TreeNode node) {
        boolean isRootNode = true;
        for (TreeNode n : nodes) {
            if (node.getPid().equals(n.getId())) {
                isRootNode = false;
                break;
            }
        }
        return isRootNode;
    }

    // 获取集合中所有的根节点
    public List<TreeNode> getRootNodes() {
        List<TreeNode> rootNodes = new ArrayList<>();
        for (TreeNode n : nodes) {
            if (rootNode(n)) {
                rootNodes.add(n);
            }
        }
        return rootNodes;
    }
}
